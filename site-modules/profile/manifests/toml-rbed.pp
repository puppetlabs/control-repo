class profile::toml-lb {
  package {'toml-rb':
    ensure => present,
    provider => 'puppetserver_gem',
    notify => Service['pe-puppetserver']
  } 


}
