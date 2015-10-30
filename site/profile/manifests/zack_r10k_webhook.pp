class profile::zack_r10k_webhook (
  $username,
  $password,
  $use_mcollective = false,
) {

  if $use_mcollective {
  
    class { 'r10k::mcollective':
      notify  => Service['mcollective'],
    }

  }

  class {'r10k::webhook::config':
    enable_ssl      => true,
    protected       => true,
    user            => $username,
    pass            => $password,
    use_mcollective => $use_mcollective,
  }

  class {'r10k::webhook':
    user    => 'root',
    group   => '0',
    require => Class['r10k::webhook::config'],
  }

}
