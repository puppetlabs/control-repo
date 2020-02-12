class profile::custom_windows::deploy_iis (

) {

  dsc {'iis':
    resource_name => 'WindowsFeature',
    module        => 'PSDesiredStateConfiguration',
    properties    => {
      ensure => 'present',
      name   => 'Web-Server',
    }  
  }
}
