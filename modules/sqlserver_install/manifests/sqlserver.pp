class sqlserver_install::sqlserver (
  #String $sourcelocation              = "\\\\freshfields\\dfs\\FCL\\SQLServerSharedRepository\\INSTALLMEDIA\\SQL 2014\\SQL 2014 - Standard",
  #String $sourcelocation              = "C:\\SQL 2014 - Standard",
  String $sourcelocation              = "\\\\10.160.0.44\\Software\\Microsoft\\SQL Server\\SQL Server 2014",
  String $sqlserver                   = "FCL-PUP-V804",
  String $sqlserverinstancename       = "MSSQLSERVER",
  Array  $sqlserversysadminaccounts   = ["Administrator"],
  String $sqlserveradminaccount       = "sa",
  String $sqlserveradminpassword      = "Passw0rd1",
  String $sqlserverwallsuser          = "sa-app-wb-stgsit",
  String $sqlserverwallspassword      = "nJTv5GrKkpsWFsUp9v",
) {

  ############################################################################
  # Installing SQL Server pre-requisites                                     #
  ############################################################################

  include chocolatey

  #reboot { 'reboot_powershell':
    #when    => pending,
    #timeout => 15,
  #}

  package { 'dotnet4.5':
    ensure   => latest,
    provider => 'chocolatey',
  }

  package { 'powershell':
    ensure   => installed,
    provider => 'chocolatey',
    require  => Package['dotnet4.5'],
    #notify   => Reboot['reboot_powershell'],
  }

  package { 'sql2014-powershell':
    ensure   => installed,
    provider => 'chocolatey',
    require  => Package['powershell'],
  }

  dsc_windowsfeature { 'NET Framework 3.5':
    dsc_ensure => 'present',
    dsc_name   => 'NET-Framework-Features',
    require    => Package['powershell'],
  }

  ############################################################################
  # Installing and configuring SQL Server                                    #
  ############################################################################

  file { 'C:\tmp':
    ensure => directory,
    path   => 'C:\tmp'
  }

  file { 'C:\tmp\sqlwallsinstall':
    ensure  => directory,
    require => File['C:\tmp'],
  }

  file { 'C:\Program Files\Microsoft SQL Server':
    ensure => directory,
  }

  file { 'C:\Program Files (x86)\Microsoft SQL Server':
    ensure => directory,
  }

  file { 'C:\MSSQLSERVER':
    ensure => directory,
  }

  sqlserver_instance { $sqlserverinstancename:
    source                => $sourcelocation,
    features              => ['SQLEngine'],
    security_mode         => 'SQL',
    #sql_sysadmin_accounts => $sqlserversysadminaccounts,
    sa_pwd                => $sqlserveradminpassword,
    sql_sysadmin_accounts => $sqlserversysadminaccounts, #[$facts['id']],
    install_switches      => {
      'TCPENABLED'          => 1,
      'SQLBACKUPDIR'        => 'C:\\MSSQLSERVER\\backupdir',
      'SQLTEMPDBDIR'        => 'C:\\MSSQLSERVER\\tempdbdir',
      'INSTALLSQLDATADIR'   => 'C:\\MSSQLSERVER\\datadir',
      'INSTANCEDIR'         => 'C:\\Program Files\\Microsoft SQL Server',
      'INSTALLSHAREDDIR'    => 'C:\\Program Files\\Microsoft SQL Server',
      'INSTALLSHAREDWOWDIR' => 'C:\\Program Files (x86)\\Microsoft SQL Server'
    },
    require               => [ File['C:\Program Files\Microsoft SQL Server'], File['C:\Program Files (x86)\Microsoft SQL Server'], File['C:\MSSQLSERVER'], Dsc_windowsfeature['NET Framework 3.5'] ],
  }

  -> sqlserver::config { $sqlserverinstancename:
    admin_login_type => 'SQL_LOGIN',
    admin_user       => $sqlserveradminaccount,
    admin_pass       => $sqlserveradminpassword,
  }

  -> sqlserver::login{ $sqlserverwallsuser:
    instance => $sqlserverinstancename,
    password => $sqlserverwallspassword,
  }

}
