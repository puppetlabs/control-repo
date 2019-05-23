####
# Class:       intapp iis
# Description: Installing IIS Windows Feature and all other necessary features and create Default Web Site
# Customer:    Freshfields Bruckhaus Deringer
# Author:      WM Promus
# Date:        April 2018
###

class iis_demo::iis (

) {

  include chocolatey

  dsc_windowsfeature { 'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
    #require    => Package['powershell'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'IIS7 - Mgmt Scripts':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Scripting-Tools',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'IIS7 - Mgmt Service':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Service',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'MSMQ':
    dsc_ensure => 'present',
    dsc_name   => 'MSMQ',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 4.5':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Asp-Net45',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 4.5 Web Services':
    dsc_ensure => 'present',
    dsc_name   => 'NET-WCF-Services45',
    require    => Dsc_windowsfeature['NET Framework 4.5'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 4.5 Web Services - ASP':
    dsc_ensure => 'present',
    dsc_name   => 'Web-ASP',
    require    => Dsc_windowsfeature['NET Framework 4.5 Web Services'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 4.5 Web Services - ASP .NET 3.5':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Asp-Net',
    require    => Dsc_windowsfeature['NET Framework 4.5 Web Services'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Web-Windows-Auth':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Windows-Auth',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'IIS Management - Console':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Mgmt-Console',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 3.5':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-Features',
    require    => Dsc_windowsfeature['IIS'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 3.5 - Core':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-Core',
    require    => Dsc_windowsfeature['NET Framework 3.5'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'NET Framework 3.5 - HTTP Activation':
    dsc_ensure => 'present',
    dsc_name   => 'NET-HTTP-Activation',
    require    => Dsc_windowsfeature['NET Framework 3.5 - Core'],
    notify     => Reboot['reboot_iis'],
  }
#############################################################################
  #dsc_windowsfeature { '.NET Framework 4.5':
    #dsc_ensure => 'present',
    #dsc_name   => 'AS-NET-Framework',
    #require    => Package['powershell'],
    #notify     => Reboot['reboot_iis'],
  #}

  dsc_windowsfeature { 'Web Server (IIS) Support':
    dsc_ensure => 'present',
    dsc_name   => 'AS-Web-Support',
    #require    => Package['powershell'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'HTTP Activation':
    dsc_ensure => 'present',
    dsc_name   => 'AS-HTTP-Activation',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Storage Services':
    dsc_ensure => 'present',
    dsc_name   => 'Storage-Services',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { '.NET Framework 4.5 Core':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-45-Core',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'ASP .NET 4.5':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-45-ASPNET',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

#dsc_windowsfeature { 'NET WCF HTTP Activation':
#  dsc_ensure => 'present',
#  dsc_name   => 'NET-WCF-HTTP-Activation',
#  require    => Dsc_windowsfeature['Web Server (IIS) Support'],
#  notify     => Reboot['reboot_iis'],
#}

#dsc_windowsfeature { 'TCP Port Sharing':
#  dsc_ensure => 'present',
#  dsc_name   => 'NET-WCF-TCP-PortSharing',
#  require    => Dsc_windowsfeature['Web Server (IIS) Support'],
#  notify     => Reboot['reboot_iis'],
#}

  dsc_windowsfeature { 'Ink and Handwriting Services':
    dsc_ensure => 'present',
    dsc_name   => 'InkAndHandwritingServices',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Media Foundation':
    dsc_ensure => 'present',
    dsc_name   => 'Server-Media-Foundation',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'SMB 1.0/CIFS File Sharing Support':
    dsc_ensure => 'present',
    dsc_name   => 'FS-SMB1',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Telnet Client':
    dsc_ensure => 'present',
    dsc_name   => 'Telnet-Client',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'User Interfaces and Infrastructure':
    dsc_ensure => 'present',
    dsc_name   => 'User-Interfaces-Infra',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Windows Powershell ISE':
    dsc_ensure => 'present',
    dsc_name   => 'PowerShell-ISE',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Process Model':
    dsc_ensure => 'present',
    dsc_name   => 'WAS-Process-Model',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'Configuration APIs':
    dsc_ensure => 'present',
    dsc_name   => 'WAS-Config-APIs',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  dsc_windowsfeature { 'WoW64 Support':
    dsc_ensure => 'present',
    dsc_name   => 'WoW64-Support',
    require    => Dsc_windowsfeature['Web Server (IIS) Support'],
    notify     => Reboot['reboot_iis'],
  }

  reboot { 'reboot_iis':
    when    => refreshed,
    timeout => 15,
  }

}
