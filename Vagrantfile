# -*- mode: ruby -*-
# vi: set ft=ruby :

# ------------------------------------------------------------------------
# CONFIGURABLE PROPERTIES
# ------------------------------------------------------------------------
$hostname  = 'laravel-project-name.dev'
$http_port = 8001
$ssh_port  = 2001

$ee_system_directory = 'system'
$ee_images_directory = 'images'
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
      'hostname'            => $hostname,
      'ee_system_directory' => $ee_system_directory,
      'ee_images_directory' => $ee_images_directory
    }

    puppet.manifest_file  = 'init.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end

  # Shared folders.
  # - Set the ownership of the ExpressionEngine directories. Very important.
  config.vm.synced_folder(
    "#{$ee_system_directory}/expressionengine/config",
    "/vagrant/#{$ee_system_directory}/expressionengine/config",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_system_directory}/expressionengine/cache",
    "/vagrant/#{$ee_system_directory}/expressionengine/cache",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/avatars/uploads",
    "/vagrant/#{$ee_images_directory}/avatars/uploads",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/captchas",
    "/vagrant/#{$ee_images_directory}/captchas",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/member_photos",
    "/vagrant/#{$ee_images_directory}/member_photos",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/pm_attachments",
    "/vagrant/#{$ee_images_directory}/pm_attachments",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/signature_attachments",
    "/vagrant/#{$ee_images_directory}/signature_attachments",
    :owner => 'www-data',
    :group => 'www-data'
  )

  config.vm.synced_folder(
    "#{$ee_images_directory}/uploads",
    "/vagrant/#{$ee_images_directory}/uploads",
    :owner => 'www-data',
    :group => 'www-data'
  )
end

