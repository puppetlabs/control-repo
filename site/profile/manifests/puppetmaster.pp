class profile::puppetmaster {

  class { 'hiera':
    hierarchy  => [
      'virtual/%{::virtual}',
      'nodes/%{::trusted.certname}',
      'common',
    ],
    hiera_yaml => '/etc/puppetlabs/code/hiera.yaml',
    datadir    => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    owner      => 'pe-puppet',
    group      => 'pe-puppet',
    notify     => Service['pe-puppetserver'],
  }

  #Lay down update-classes.sh for use in r10k postrun_command
  #This is configured via the pe_r10k::postrun key in hiera
  file { '/usr/local/bin/update-classes.sh' :
    ensure => file,
    source => 'puppet:///modules/profile/puppetmaster/update-classes.sh',
    mode   => '0755',
  }

  #https://docs.puppetlabs.com/puppet/latest/reference/config_file_environment.html#environmenttimeout
  ini_setting { 'environment_timeout = unlimited':
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'environment_timeout',
    value   => 'unlimited',
    notify  => Service['pe-puppetserver'],
  }

}
