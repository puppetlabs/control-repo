####
# Class:       intapp open webapp openweb
# Description:
# Customer:    Freshfields Bruckhaus Deringer
# Author:      WM Promus
# Date:        April 2018
###

class iis_demo::uninstall_iis (

) {

  dsc_windowsfeature { 'IIS':
    dsc_ensure => 'absent',
    dsc_name   => 'Web-Server',
    #require    => Package['powershell'],
    #notify     => Reboot['reboot_iis'],
  }

  file { 'C:\\inetpub':
    ensure  => absent,
  }

}
