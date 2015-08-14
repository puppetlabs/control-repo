class profile::puppetmaster {

  class { 'hiera':
    hierarchy  => [
      'nodes/%{::trusted.certname}',
      'common',
    ],
    hiera_yaml => '/etc/puppetlabs/code/hiera.yaml',
    datadir    => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    owner      => 'root',
    group      => 'root',
  }
  
}
