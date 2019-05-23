####
# Class:       sqlserver_2014
# Description: Installing SQL server and its prerequisites and configuration
# Customer:    Freshfields Bruckhaus Deringer
# Author:      WM Promus
# Date:        April 2018
###

class ag_sqlserver (
  String $sourcelocation            = '\\\\freshfields\\dfs\\FCL\\SQLServerSharedRepository\\INSTALLMEDIA\\SQL 2014\\SQL 2014 - Standard',
  String $windowssourcelocation     = '\\\\freshfields\\dfs\\FCL\\ISO\\Microsoft\\WINDOWS_SERVER_2012R2\\ISO_X19-82891\\sources\\sxs',
  String $sqlserverinstancename     = 'MSSQLSERVER',
  String $sqlserveradminaccount     = 'sa',
  String $sqlserveradminpassword    = 'Passw0rd1',
  String $sqlserversecuritymode     = 'SQL',
  Array $sqlserverfeatures          = ['SQLEngine'],
  String $sqlserverinstancefolder   = 'C:\\Program Files\\Microsoft SQL Server',
  String $sqlserverdatafolder       = 'E:\\SQLData',
  String $sqlserverlogfolder        = 'F:\\SQLLog',
  String $sqlservertempdbfolder     = 'G:\\TempDB',
  String $sqlserverbackupfolder     = 'E:\\SQLBackup',
) {

  ############################################################################
  # Installing SQL Server pre-requisites                                     #
  ############################################################################

  include chocolatey

  reboot { 'reboot_powershell':
    when    => pending,
    timeout => 15,
  }
  package { 'dotnet4.5':
    ensure   => latest,
    provider => 'chocolatey',
  }
  package { 'powershell':
    ensure   => installed,
    provider => 'chocolatey',
    require  => Package['dotnet4.5'],
    notify   => Reboot['reboot_powershell'],
  }
  package { 'sql2014-powershell':
    ensure   => installed,
    provider => 'chocolatey',
    require  => Package['powershell'],
  }
  dsc_windowsfeature { 'NET Framework 3.5':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-Features',
    dsc_source => $windowssourcelocation,
    require    => Package['powershell'],
  }
  ############################################################################
  # Installing and configuring SQL Server                                    #
  ############################################################################

  file { 'C:\\MSSQLSERVER':
    ensure => directory,
  }
  -> file { $sqlserverinstancefolder:
    ensure => directory,
  }
  -> file { $sqlserverdatafolder:
    ensure => directory,
  }
  -> file { $sqlserverlogfolder:
    ensure => directory,
  }
  -> file { $sqlservertempdbfolder:
    ensure => directory,
  }
  -> file { $sqlserverbackupfolder:
    ensure => directory,
  }
  -> sqlserver_instance { $sqlserverinstancename:
    source                 => $sourcelocation,
    windows_feature_source => $windowssourcelocation,
    features               => $sqlserverfeatures,
    security_mode          => $sqlserversecuritymode,
    sa_pwd                 => $sqlserveradminpassword,
    #sql_sysadmin_accounts  => $sqlserversysadminaccounts,
    sql_sysadmin_accounts  => [$facts['id'], "007"],
    install_switches       => {
      'TCPENABLED'          => 1,
      'SQLBACKUPDIR'        => $sqlserverbackupfolder,
      'SQLTEMPDBDIR'        => $sqlservertempdbfolder,
      'INSTALLSQLDATADIR'   => $sqlserverdatafolder,
      'INSTANCEDIR'         => $sqlserverinstancefolder,
      'INSTALLSHAREDDIR'    => $sqlserverinstancefolder,
      'INSTALLSHAREDWOWDIR' => 'C:\\Program Files (x86)\\Microsoft SQL Server',
    },
    require                => Dsc_windowsfeature['NET Framework 3.5'],
  }
  -> sqlserver::config { $sqlserverinstancename:
     admin_login_type => 'SQL_LOGIN',
     admin_user       => $sqlserveradminaccount,
     admin_pass       => $sqlserveradminpassword,
  }
    #->
    #sqlserver::login{ $sqlserveruser:
    #  instance => $sqlserverinstancename,
    #  password => $sqlserveruserpassword,
    #}

}
