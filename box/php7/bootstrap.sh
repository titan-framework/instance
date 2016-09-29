#!/bin/bash

echo "Start provisioner script..."

echo "Changing root password to 'vagrant'..."

passwd <<EOF
vagrant
vagrant
EOF

echo "Done!"

export DEBIAN_FRONTEND=noninteractive

echo "Updating, upgrading and dist upgrading..."

apt-get -y update

apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

apt-get -y upgrade

echo "Done!"

echo "Install a lot of dependencies..."

echo "postfix postfix/mailname string localhost" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

apt-get install -y antiword aptitude build-essential bzip2 curl git locales locate mailutils nginx ntpdate openjdk-9-jre php7.0-fpm php7.0-cli php7.0-curl php7.0-dev php7.0-gd php-imagick php7.0-ldap php7.0-mcrypt php-pear php7.0-pgsql php7.0-sqlite postfix subversion xpdf-utils unzip vim

echo "Done!"

echo "Configuring locales..."

locale-gen "en_US.UTF-8"
locale-gen "es_ES.UTF-8"
locale-gen "pt_BR.UTF-8"

echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

dpkg-reconfigure --frontend=noninteractive locales

echo "Done!"

echo "Installing PostgreSQL..."

apt-get install -y postgresql-9.5

echo "Done!"

echo "Installing PHP Composer..."

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

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

cp -f /vagrant/settings/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf

cp -f /vagrant/settings/postgresql.conf /etc/postgresql/9.5/main/postgresql.conf

/etc/init.d/postgresql restart

echo "Done!"

echo "Nginx and PHP..."

cp -f /vagrant/settings/php-fpm.ini /etc/php/7.0/fpm/php.ini

cp -f /vagrant/settings/php-cli.ini /etc/php/7.0/cli/php.ini

rm -rf /var/www/html

mkdir -p /var/www/log

cp -f /vagrant/settings/nginx-default /etc/nginx/sites-available/default

/etc/init.d/nginx restart

echo "Done!"

echo "SSH..."

cp -f /vagrant/settings/sshd_config /etc/ssh/sshd_config

/etc/init.d/ssh restart

echo "Done!"

echo "CRON..."

cp /vagrant/settings/cron /etc/cron.d/titan

/etc/init.d/cron reload
/etc/init.d/cron restart

echo "Done!"

echo "Getting Titan Framework..."

composer create-project titan-framework/install /var/www/titan

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
