####
# Class:       intapp iis iis_prereqs
# Description: Installing IIS Windows Feature and all other necessary features
# Customer:    Freshfields Bruckhaus Deringer
# Author:      WM Promus
# Date:        April 2018
###

class iis::iis_prereqs (
) {

  include chocolatey
  include iis::iis

  dsc_windowsfeature { '.NET Framework 4.5':
    dsc_ensure => 'present',
    dsc_name   => 'AS-NET-Framework',
    #require    => Package['powershell'],
    notify     => Reboot['reboot_iis'],
  }

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

}
