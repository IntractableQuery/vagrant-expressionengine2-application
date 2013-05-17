# -*- mode: ruby -*-
# vi: set ft=ruby :

# ------------------------------------------------------------------------
# CONFIGURABLE PROPERTIES
# ------------------------------------------------------------------------
$hostname  = 'laravel-project-name.dev'
$http_port = 8001
$ssh_port  = 2001
# ------------------------------------------------------------------------

Vagrant.configure('2') do |config|
  # Basics
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Networking.
  config.vm.hostname = $hostname
  config.vm.network :forwarded_port, guest: 22, host: $ssh_port
  config.vm.network :forwarded_port, guest: 80, host: $http_port

  # Provisioning.
  config.vm.provision :shell, :path => 'puppet/bootstrap/bootstrap.sh'

  config.vm.provision :puppet do |puppet|
    puppet.facter = {
      'hostname' => $hostname
    }

    puppet.manifest_file  = 'init.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end

  # Shared folders.
  # - Set the ownership of the app/storage directory. Very important.
  config.vm.synced_folder "app/storage", "/vagrant/app/storage", :owner => 'www-data', :group => 'www-data'
end

