class profile::webhook_mcollective {

  class { 'r10k::mcollective':
    notify  => Service['mcollective'],
  }

  include r10k::webhook::config

  class {'r10k::webhook':
    user    => 'root',
    group   => '0',
    require => Class['r10k::webhook::config'],
  }
 
}
