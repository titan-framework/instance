#!/bin/sh

echo "Start provisioner script..."

echo "Changing root password to 'vagrant'..."

passwd <<EOF
vagrant
vagrant
EOF

echo "Done!"

echo "Updating, upgrading and dist upgrading..."

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade

echo "Done!"

echo "Install a lot of dependencies..."

echo "postfix postfix/mailname string localhost" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

DEBIAN_FRONTEND=noninteractive apt-get install -y vim mailutils ntpdate build-essential bzip2 subversion apache2 postfix php5 php5-pgsql php5-gd php5-imagick php5-sqlite php5-cli php5-curl php5-mcrypt php5-ldap php-pear php5-dev php-apc xpdf-utils antiword openjdk-7-jre locales locate postgresql-9.4

echo "Done!"

echo "Configuring locales..."

locale-gen "en_US.UTF-8"
locale-gen "es_ES.UTF-8"
locale-gen "pt_BR.UTF-8"

echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

dpkg-reconfigure --frontend=noninteractive locales

echo "Done!"

echo "Cleaning apt-get..."

apt-get autoremove
apt-get clean -y
apt-get autoclean -y

find /var/lib/apt -type f | xargs rm -f

find /var/lib/doc -type f | xargs rm -f

echo "Done!"

echo "Creating folders to instance (file, backup and cache)..."

mkdir -p /var/www/app/file
mkdir -p /var/www/app/cache
mkdir -p /var/www/app/backup

echo "Done!"

echo "Configuring services..."

echo "PostgreSQL..."

cp -f /vagrant/setting/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

cp -f /vagrant/setting/postgresql.conf /etc/postgresql/9.4/main/postgresql.conf

/etc/init.d/postgresql restart

echo "Done!"

echo "Apache and PHP..."

cp -f /vagrant/setting/php_web.ini /etc/php5/apache2/php.ini

cp -f /vagrant/setting/php_cli.ini /etc/php5/cli/php.ini

rm -rf /var/www/html

mkdir -p /var/www/log

cp -f /vagrant/setting/apache2.conf /etc/apache2/apache2.conf

cp -f /vagrant/setting/000-default.conf /etc/apache2/sites-available/000-default.conf

a2enmod rewrite

/etc/init.d/apache2 restart

echo "Done!"

echo "SSH..."

cp -f /vagrant/setting/sshd_config /etc/ssh/sshd_config

/etc/init.d/ssh restart

echo "Done!"

echo "CRON..."

cp /vagrant/setting/cron /etc/cron.d/titan

/etc/init.d/cron reload
/etc/init.d/cron restart

echo "Done!"

echo "Getting Titan Framework..."

mkdir -p /var/www/titan

svn co --trust-server-cert https://svn.cnpgc.embrapa.br/titan/core /var/www/titan

chown -R root:staff /var/www/titan
find /var/www/titan -type d -exec chmod 775 {} \;
find /var/www/titan -type f -exec chmod 664 {} \;

echo "Done!"

echo "Creating DB and importing 'last.db'..."

su - postgres -c "createuser -E titan" > /vagrant/vagrant.log

su - postgres -c "createdb -E utf8 -O titan -T template0 instance" > /vagrant/vagrant.log

su - postgres -c "psql -d instance -U titan < db/last.sql" > /vagrant/vagrant.log

echo "Done!"

echo "Making updatedb command..."

updatedb

echo "All done!"
