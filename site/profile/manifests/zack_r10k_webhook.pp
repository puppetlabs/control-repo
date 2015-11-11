class profile::zack_r10k_webhook (
  $use_mcollective = false,
) {

  $username = hiera('webhook_username', fqdn_rand_string(10, '', 'username'))
  $password = hiera('webhook_password', fqdn_rand_string(20, '', 'password'))

  $gms_api_token         = hiera('gms_api_token', undef)
  $git_management_system = hiera('git_management_system', undef)

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

  if !empty($gms_api_token)  {
    git_webhook { "web_post_receive_webhook-${::fqdn}" :
      ensure             => present,
      webhook_url        => "https://${username}:${password}@${::fqdn}:8088/payload",
      token              => $gms_api_token,
      project_name       => 'puppet/control-repo',
      server_url         => hiera('gms_server_url'),
      provider           => $git_management_system,
      disable_ssl_verify => true,
    }
  }
}
