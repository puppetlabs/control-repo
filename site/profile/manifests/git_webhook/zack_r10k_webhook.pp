class profile::git_webhook::zack_r10k_webhook (
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

  $r10k_ssh_key_file = '/root/.ssh/r10k_rsa'
  exec { 'create r10k ssh key' :
    command => "/usr/bin/ssh-keygen -t rsa -b 2048 -C 'r10k' -f ${r10k_ssh_key_file} -q -N ''",
    creates => $r10k_ssh_key_file,
  }

  if !empty($gms_api_token)  {
    git_deploy_key { "add_deploy_key_to_puppet_control-${::fqdn}":
      ensure       => present,
      name         => $::fqdn,
      path         => "${r10k_ssh_key_file}.pub",
      token        => $gms_api_token,
      project_name => 'puppet/control-repo',
      server_url   => hiera('gms_server_url'),
      provider     => $git_management_system,
    }

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
