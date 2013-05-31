class expressionengine {
  # The EE directories are Facter facts, set in the Vagrantfile.

  file { "/vagrant/${ee_system_directory}/expressionengine/config/config.php":
    ensure => 'file',
    mode   => '0666',
  }

  file { "/vagrant/${ee_system_directory}/expressionengine/config/database.php":
    ensure => 'file',
    mode   => '0666',
  }

  file { "/vagrant/${ee_system_directory}/expressionengine/cache":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/avatars/uploads":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/captchas":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/member_photos":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/pm_attachments":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/signature_attachments":
    ensure => 'directory',
    mode   => '0777',
  }

  file { "/vagrant/${ee_images_directory}/uploads":
    ensure => 'directory',
    mode   => '0777',
  }
}

