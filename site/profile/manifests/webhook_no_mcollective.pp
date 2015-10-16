class profile::webhook_no_mcollective {

  class {'r10k::webhook::config':
    use_mcollective => false,
  }

  class {'r10k::webhook':
    user    => 'root',
    group   => '0',
    require => Class['r10k::webhook::config'],
  }

}
