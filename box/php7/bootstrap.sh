#!/bin/bash

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

echo "Adding Dotdeb (http://dotdeb.org) to sources of APT..."

echo "deb http://packages.dotdeb.org jessie all" | tee -a /etc/apt/sources.list.d/dotdeb.list
echo "deb-src http://packages.dotdeb.org jessie all" | tee -a /etc/apt/sources.list.d/dotdeb.list

wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add -

apt-get -y update

echo "Done!"

echo "Install a lot of dependencies..."

echo "postfix postfix/mailname string localhost" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

DEBIAN_FRONTEND=noninteractive apt-get install -y antiword aptitude build-essential bzip2 curl default-jdk git libav-tools locales locate mailutils memcached nginx ntpdate php7.0-fpm php7.0-cli php7.0-curl php7.0-dev php7.0-gd php7.0-imagick php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-memcached php7.0-pgsql php7.0-sqlite php-pear postfix postgresql-9.4 subversion xpdf-utils unzip vim

echo "Done!"

echo "Configuring locales..."

locale-gen "en_US.UTF-8"
locale-gen "es_ES.UTF-8"
locale-gen "pt_BR.UTF-8"

echo -e 'LANG="en_US.UTF-8"\nLANGUAGE="en_US:en"\n' > /etc/default/locale

dpkg-reconfigure --frontend=noninteractive locales

echo "Done!"

echo "Installing PHP Composer..."

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

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

echo "Installing composer dependencies..."

composer install -d /var/www/app

echo "Done!"

echo "Configuring services..."

echo "PostgreSQL..."

cp -f /vagrant/box/php7/settings/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf

cp -f /vagrant/box/php7/settings/postgresql.conf /etc/postgresql/9.4/main/postgresql.conf

/etc/init.d/postgresql restart

echo "Done!"

echo "Memcached..."

cp -f /vagrant/box/php7/settings/memcached.conf /etc/memcached.conf

/etc/init.d/memcached restart

echo "Done!"

echo "PHP 7.0 FPM..."

cp -f /vagrant/box/php7/settings/php-fpm.ini /etc/php/7.0/fpm/php.ini

cp -f /vagrant/box/php7/settings/php-cli.ini /etc/php/7.0/cli/php.ini

cp -f /vagrant/box/php7/settings/php-www.conf /etc/php/7.0/fpm/pool.d/www.conf

/etc/init.d/php7.0-fpm restart

echo "Done!"

echo "Nginx..."

rm -rf /var/www/html

mkdir -p /var/www/log

cp -f /vagrant/box/php7/settings/nginx-default /etc/nginx/sites-available/default

/etc/init.d/nginx restart

echo "Done!"

echo "SSH..."

cp -f /vagrant/box/php7/settings/sshd_config /etc/ssh/sshd_config

/etc/init.d/ssh restart

echo "Done!"

echo "CRON..."

cp /vagrant/box/php7/settings/cron /etc/cron.d/titan

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

echo "Updating DB (applying changes on 'update/db' folder)..."

/usr/bin/php /var/www/titan/update/db.php /var/www/app/

echo "Done!"

echo "Installing MailHog..."

wget --quiet -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v0.2.1/MailHog_linux_amd64

chmod +x /usr/local/bin/mailhog

cp -f /vagrant/box/php7/settings/mailhog /etc/init.d/

chmod +x /etc/init.d/mailhog

update-rc.d mailhog defaults

service mailhog start

echo "Done!"

echo "Runnig 'updatedb' command (for locate)..."

updatedb

echo "All done!"

echo "To access, use a SSH client to localhost:2222 with login 'root' and password 'vagrant'."

echo "Titan instance is running at http://localhost:8090/"

echo "All e-mail messages are catchered and can be accessed at http://localhost:8025/"

echo "Thanks for using Titan Framework! Enjoy it ;-)"

echo "More info at http://titanframework.com"
