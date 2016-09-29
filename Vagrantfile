Vagrant.configure("2") do |config|
  # To activate...
  # - PHP 7.0, use "bento/ubuntu-16.04". 
  # - PHP 5.6, use "debian/jessie64".
  
  # config.vm.box = "bento/ubuntu-16.04"
  config.vm.box = "debian/jessie64"
  
  config.vm.network "forwarded_port", guest: 80, host: 8090
  config.vm.network "forwarded_port", guest: 5432, host: 5431
  
  config.vm.network "private_network", ip: "192.168.33.10"
  
  config.vm.synced_folder ".", "/var/www/app", type: "virtualbox"
  config.vm.synced_folder "db", "/var/lib/postgresql/db", type: "virtualbox"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  
  # To activate...
  # - PHP 7.0, use "box/php7/bootstrap.sh". 
  # - PHP 5.6, use "box/php5/bootstrap.sh".
  
  # config.vm.provision "shell", path: "box/php7/bootstrap.sh"
  config.vm.provision "shell", path: "box/php5/bootstrap.sh"
end
