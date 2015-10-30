class profile::stash {

  class { 'java' :
    version => present,
  } ->

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.4',
  }->
  class { 'postgresql::server': } ->
  
  postgresql::server::db { 'stash':
    user     => 'stash',
    password => postgresql_password('stash', 'password'),
  } ->

  class { 'stash':
    javahome  => '/etc/alternatives/java_sdk',
    #dev.mode grants a 24-hour license for testing
    java_opts => '-Datlassian.dev.mode=true',
  }

  file { '/opt/puppetlabs/bin/stash_mco.rb':
    source => 'puppet:///modules/r10k/stash_mco.rb',
  }

}
