# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 4848, host: 4848
  config.vm.synced_folder "./sharedfiles", "/vagrant_data"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end
end
