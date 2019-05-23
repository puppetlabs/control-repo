####
# Class:       intapp open webapp openweb
# Description:
# Customer:    Freshfields Bruckhaus Deringer
# Author:      WM Promus
# Date:        April 2018
###

class iis_demo::uninstall_iis (
  String $app_pool_name            = 'TestAppPool',
  String $iis_site_name            = 'TestIisSite',
  String $iis_webapp_name          = 'TestWebSite',

) {

  iis_application { "${iis_site_name}\\${iis_webapp_name}":
    ensure => 'absent',
  }

  iis_site { $iis_site_name:
    ensure => 'absent',
  }

  iis_application_pool { $app_pool_name:
    ensure => 'absent',
  }

  dsc_windowsfeature { 'IIS':
    dsc_ensure => 'absent',
    dsc_name   => 'Web-Server',
    #require    => Package['powershell'],
    notify     => Reboot['dsc_reboot'],
  }

  reboot { 'dsc_reboot':
    when    => refreshed,
    timeout => 10,
  }

  file { 'C:\\inetpub':
    ensure  => directory,
    recurse => true,
    purge   => true,
    force   => true,
  }
}
