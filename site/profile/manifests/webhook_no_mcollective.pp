class profile::webhook_no_mcollective (
  $username,
  $password
) {

  class {'r10k::webhook::config':
    enable_ssl      => true,
    protected       => true,
    user            => $username,
    pass            => $password,
    use_mcollective => false,
  }

  class {'r10k::webhook':
    user    => 'root',
    group   => '0',
    require => Class['r10k::webhook::config'],
  }

}
