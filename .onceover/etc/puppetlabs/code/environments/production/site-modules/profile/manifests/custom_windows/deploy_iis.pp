class profile::custom_windows::deploy_iis (

  String $user_acl = $profile::custom_windows::config_server::user_name,

) {

  dsc {'iis-web':
    resource_name => 'WindowsFeature',
    module        => 'PSDesiredStateConfiguration',
    properties    => {
      ensure => 'present',
      name   => 'Web-Server',
    }  
  }

  iis_site {'Default Web Site':
    ensure  => absent,
    require => Dsc['iis-web'],
  }

  file { 'c:\\inetpub\\complete':
    ensure => 'directory'
  }

  acl { 'c:\\inetpub\\complete':
    permissions => [
      {'identity' => $user_acl, 'rights' => ['read', 'execute']},
    ],
  }

  iis_application_pool { 'complete_site_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

  iis_application_pool {'test_app_pool':
    ensure                    => 'present',
    enable32_bit_app_on_win64 => true,
    managed_runtime_version   => '',
    managed_pipeline_mode     => 'Classic',
    start_mode                => 'AlwaysRunning'
  }

  iis_site { 'complete':
    ensure           => 'started',
    physicalpath     => 'c:\\inetpub\\complete',
    applicationpool  => 'complete_site_app_pool',
    enabledprotocols => 'https',
    bindings         => [
      {
        'bindinginformation'   => '*:443:',
        'protocol'             => 'https',
        'certificatehash'      => '3598FAE5ADDB8BA32A061C5579829B359409856F',
        'certificatestorename' => 'MY',
        'sslflags'             => 1,
      },
    ],
    require => File['c:\\inetpub\\complete'],
    notify  => Reboot['dsc_reboot'],
  }

  reboot { 'dsc_reboot' :
    message => 'DSC has requested a reboot',
    when    => 'pending',
    onlyif  => 'pending_dsc_reboot',
  }
}
