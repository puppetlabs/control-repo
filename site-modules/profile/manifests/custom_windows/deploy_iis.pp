class profile::custom_windows::deploy_iis (

) {

  dsc_windowsfeature {'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
  }

}
