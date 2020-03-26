class profile::puppetserver::bootstrap {

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

#  pe_node_group { 'puppetmaster-dashboard':
#      ensure               => 'present',
#      classes              => {'puppet_metrics_dashboard::profile::master::postgres_access' => { }},
#      description          => 'Puppetmaster Dashboard workaround group',
#      environment          => 'production',
#      parent               => 'All Nodes',
#      rule                 => ['or', ['=', 'name', $facts['puppet_master_server']]],
#    }
}
