#!/bin/bash

if [ -d ".vagrant/machines/default/virtualbox/id" ]; then
  echo "The Vagrant environment already exists!"
  echo "Run this script only to prepare Vagrant to first up."
  echo "Now, you can run 'vagrant up' to run VM."
  echo "If you ensure to run this script, first clean your environment with 'vagrant destroy'."

  exit
fi

echo "Preparing Vagrant environment..."

echo "Updating Vagrant box..."

vagrant box update

echo "Updating Vagrant plugins..."

vagrant plugin update

echo "Updating VBGuest inside VM..."

export VAGRANT_FIRST_RUN='TRUE'

vagrant up --no-provision

vagrant halt

vagrant up --no-provision

vagrant vbguest --do install --force

vagrant halt

export VAGRANT_FIRST_RUN='FALSE'

echo "All done! Now the 'vagrant up' command will works fine!"
