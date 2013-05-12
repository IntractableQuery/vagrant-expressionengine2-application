class app {

  # -----------------------------------------------------------------
  # CONFIGURABLE PROPERTIES
  # -----------------------------------------------------------------
  $root_password = 'root'
  $db_name       = 'dev'
  $db_username   = 'jimbob'
  $db_password   = 'password'
  # -----------------------------------------------------------------

  # -----------------------------------------------------------------
  # Apache
  # -----------------------------------------------------------------
  include 'apache'

  apache::module { 'auth-mysql': }

  apache::module { 'php5':
    enable_module => 'true',
  }


  # -----------------------------------------------------------------
  # MySQL
  # -----------------------------------------------------------------
  class { 'mysql':
    root_password => $root_password,
  }

  mysql::db::create { $db_name: }

  mysql::user::create { $db_username:
    host     => 'localhost',
    password => $db_password,
  }

  mysql::user::grant {$db_username:
    host     => 'localhost',
    database => $db_name,
  }


  # -----------------------------------------------------------------
  # PHP
  # -----------------------------------------------------------------
  include 'php'
  include 'php::pear'

  php::extension { [
    'php-pear',
    'php5-curl',
    'php5-gd',
    'php5-mcrypt',
    'php5-mysql',
    'php5-sqlite',
    'php5-xdebug',
  ]: }

  php::pear::install { 'phpunit':
    package => 'pear.phpunit.de/PHPUnit',
    creates => '/usr/bin/phpunit',
  }


  # -----------------------------------------------------------------
  # Oddments
  # -----------------------------------------------------------------
  include 'curl'
  include 'composer'
}

