# -*- mode: ruby -*-
# vi: set ft=ruby :

# ------------------------------------------------------------------------
# CONFIGURABLE PROPERTIES
# ------------------------------------------------------------------------
$hostname  = 'lamp-vm.dev'
$http_port = 8080
# ------------------------------------------------------------------------

Vagrant.configure('2') do |config|
  # Basics
  config.vm.box     = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Networking.
  config.vm.hostname = $hostname
  config.vm.network :forwarded_port, guest: 80, host: $http_port

  config.vm.provision :shell, :path => 'puppet/bootstrap/bootstrap.sh'

  config.vm.provision :puppet do |puppet|
    puppet.facter = {
      'hostname' => $hostname
    }

    puppet.manifest_file  = 'init.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end

