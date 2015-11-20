class profile::code_manager {

  $authenticate_webhook = hiera('puppet_enterprise::master::code_manager::authenticate_webhook', true) 

  $code_manager_service_user = 'code_manager_service_user'
  $code_manager_service_user_password = fqdn_rand_string(40, '', "${code_manager_service_user}_password")
  
  #puppet_master_classifier_settings is a custom function
  $classifier_settings   = puppet_master_classifer_settings()
  $classifier_hostname   = $classifier_settings['server']
  $classifier_port       = $classifier_settings['port']

  $token_directory       = '/etc/puppetlabs/puppetserver/.puppetlabs'
  $token_filename        = "${token_directory}/${code_manager_service_user}_token"

  $gms_api_token         = hiera('gms_api_token', undef)
  $git_management_system = hiera('git_management_system', undef)

  rbac_user { $code_manager_service_user :
    ensure       => 'present',
    name         => $code_manager_service_user,
    email        => "${code_manager_service_user}@example.com",
    display_name => 'Code Manager Service Account',
    password     => $code_manager_service_user_password,
    roles        => [ 'Deploy Environments' ],
  }

  file { $token_directory :
    ensure => directory,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }

  exec { "Generate Token for ${code_manager_service_user}" :
    command => epp('profile/code_manager/create_rbac_token.epp',
                  { 'code_manager_service_user'          => $code_manager_service_user,
                    'code_manager_service_user_password' => $code_manager_service_user_password,
                    'classifier_hostname'                => $classifier_hostname,
                    'classifier_port'                    => $classifier_port,
                    'token_filename'                     => $token_filename
                  }),
    creates => $token_filename,
    require => [ Rbac_user[$code_manager_service_user], File[$token_directory] ],
  }


  #this file cannont be read until the next run after the above exec
  #because the file function runs on the master not on the agent
  #so the file doesn't exist at the time the function is run
  $rbac_token_file_contents = no_fail_file($token_filename)

  if !empty($gms_api_token) {
    if $authenticate_webhook and !empty($rbac_token_file_contents) {

      $rbac_token = parsejson($rbac_token_file_contents)['token']

      $token_info = "&token=${rbac_token}"
    }
    else {
      $token_info = ''
    }

    $code_manager_webhook_type = $git_management_system ? {
                                   'gitlab' => 'github',
                                   default  => $git_management_system,
    }

    git_webhook { "code_manager_post_receive_webhook-${::fqdn}" :
      ensure             => present,
      webhook_url        => "https://${::fqdn}:8170/code-manager/v1/webhook?type=${code_manager_webhook_type}${token_info}",
      token              => $gms_api_token,
      project_name       => 'puppet/control-repo',
      server_url         => hiera('gms_server_url'),
      provider           => $git_management_system,
      disable_ssl_verify => true,
    }
  }
}
