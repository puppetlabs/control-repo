class profile::puppet::puppetserver {

  ini_setting { 'hiera_config':
    ensure => present,
    path => $::settings::config,
    section => 'master',
    setting => 'hiera_config',
    value => "${::settings::environmentpath}/production/hiera.yaml",
  }

  file { "${::settings::confdir}/hiera.yaml":
    ensure => absent,
  }

  package { 'puppetserver hiera-eyaml':
    ensure   => present,
    name     => 'hiera-eyaml',
    provider => 'puppetserver_gem',
    notify   => Service['pe-puppetserver'],
  }

  package { 'puppet hiera-eyaml':
    ensure   => present,
    name     => 'hiera-eyaml',
    provider => 'puppet_gem',
  }

  file { ['/etc/puppetlabs/secure', '/etc/puppetlabs/secure/keys']:
    ensure => directory,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0750',
  }
}
