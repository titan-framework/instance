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
DEBIAN_FRONTEND=noninteractive  apt-get -o Dpkg::Options::="--force-confold" -y upgrade

echo "Done!"

echo "Install a lot of dependencies..."

echo "postfix postfix/mailname string localhost" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

DEBIAN_FRONTEND=noninteractive apt-get install -o Dpkg::Options::="--force-confold" -y antiword aptitude build-essential bzip2 curl default-jdk git imagemagick locales locate mailutils memcached nginx ntpdate php7.3-fpm php7.3-cli php7.3-curl php7.3-dev php7.3-gd php7.3-imagick php7.3-ldap php7.3-mbstring php7.3-memcached php7.3-pgsql php7.3-sqlite php-pear postfix subversion xpdf-utils unzip vim

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

DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql-11

pg_ctlcluster 11 main start

cp -f /vagrant/box/settings/pg_hba.conf /etc/postgresql/11/main/pg_hba.conf

cp -f /vagrant/box/settings/postgresql.conf /etc/postgresql/11/main/postgresql.conf

/etc/init.d/postgresql restart

echo "Done!"

echo "Memcached..."

cp -f /vagrant/box/settings/memcached.conf /etc/memcached.conf

/etc/init.d/memcached restart

echo "Done!"

echo "PHP 7.3 FPM..."

cp -f /vagrant/box/settings/php-fpm.ini /etc/php/7.3/fpm/php.ini

cp -f /vagrant/box/settings/php-cli.ini /etc/php/7.3/cli/php.ini

cp -f /vagrant/box/settings/php-www.conf /etc/php/7.3/fpm/pool.d/www.conf

/etc/init.d/php7.3-fpm restart

echo "Done!"

echo "Nginx..."

rm -rf /var/www/html

mkdir -p /var/www/log

cp -f /vagrant/box/settings/nginx-default /etc/nginx/sites-available/default

/etc/init.d/nginx restart

echo "Done!"

echo "SSH..."

cp -f /vagrant/box/settings/sshd_config /etc/ssh/sshd_config

/etc/init.d/ssh restart

echo "Done!"

echo "CRON..."

cp /vagrant/box/settings/cron /etc/cron.d/titan

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

wget --quiet -O /usr/local/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64

chmod +x /usr/local/bin/mailhog

cp -f /vagrant/box/settings/mailhog /etc/init.d/

chmod +x /etc/init.d/mailhog

update-rc.d mailhog defaults

service mailhog start

echo "Done!"

echo "Cleaning apt-get..."

apt-get autoremove
apt-get clean -y
apt-get autoclean -y

find /var/lib/apt -type f | xargs rm -f

find /var/lib/doc -type f | xargs rm -f

echo "Done!"

echo "Runnig 'updatedb' command (for locate)..."

updatedb

echo "Done!"

echo "Renaming machine to 'titan'..."

echo "titan" > /etc/hostname

sed -i -- 's/stretch/titan/g' /etc/hosts

echo "Done!"

echo ""

echo "########## SUMMARY ############"

echo "All done! See above for possible errors."

echo ""

echo "To access your new environment with Titan instance, use 'vagrant ssh' command or"

echo "a SSH client to localhost:2222 with login 'root' and password 'vagrant'."

echo ""

echo "Titan instance is running at http://localhost:8090/ (the login and password is both 'admin')."

echo ""

echo "All e-mail messages are catched and can be accessed at http://localhost:8025/"

echo ""

echo "Thanks for using Titan Framework! Enjoy it ;-)"

echo "More info and documentation at http://titanframework.com"

echo "###############################"

echo ""

echo "One last thing: is necessary reboot VM to reload network settings..."

echo "Please, wait another few seconds!"

echo ""

echo "Rebooting..."
