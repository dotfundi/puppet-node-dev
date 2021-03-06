include git

node 'node-dev' {

  #node
  class { 'nodejs':
   version => 'stable',
  }

  package { 'bower':
    provider => 'npm',
    require  => Class['nodejs']
  }

  package { 'gulp':
    provider => 'npm',
    require  => Class['nodejs']
  }

  package { 'slush':
    provider => 'npm',
    require  => Class['nodejs']
  }

  package { 'slush-y':
    provider => 'npm',
    require  => Class['nodejs']
  }


  # create a directory      
  file { "/data":
    ensure => "directory",
  }

  # create a directory      
  file { "/data/db":
    ensure => "directory",
    owner  => "vagrant",
  }


  class {'::mongodb::globals':
    manage_package_repo => true,
  }->class {'::mongodb::server':
    port    => 27018,
    bind_ip => ["0.0.0.0"],
    verbose => true,
  }
}
