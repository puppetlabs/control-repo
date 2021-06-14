class role::example {

  package { 'hiera-eyaml-server':
    ensure => installed,
    name => 'hiera-eyaml',
    provider => 'puppetserver_gem',
# require => File['gemrc'],
}

}
