class profile::toml-rbed {
  package {'toml-rb':
    ensure => present,
    provider => 'puppetserver_gem',
    notify => Service['pe-puppetserver']
  }


}
