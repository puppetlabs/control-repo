class sqlserver_install (
  #String $sourcelocation              = "\\\\10.160.0.44\\Software\\Microsoft\\SQL Server\\SQL Server 2014",
  String $sourcelocation              = "\\\\freshfields\\dfs\\FCL\\SQLServerSharedRepository\\INSTALLMEDIA\\SQL 2014\\SQL 2014 - Standard",
  String $sqlserver                   = "FCL-SQL-V358",
  String $sqlserverinstancename       = "MSSQLSERVER",
  Array  $sqlserversysadminaccounts   = ["Administrator"],
  String $sqlserveradminaccount       = "sa",
  String $sqlserveradminpassword      = "Passw0rd1",
  String $sqlserverdbname             = "WALLSstgSit",
  String $sqlserverdbnamecentraladmin = "CentralAdministration",
  String $webappserver                = "FCL-WEB-V358",
  String $wbapplicationwebsitename    = "walls",
) {

  class { 'sqlserver_install::sqlserver':
    sourcelocation            => $sourcelocation,
    sqlserver                 => $sqlserver,
    sqlserverinstancename     => $sqlserverinstancename,
    sqlserversysadminaccounts => $sqlserversysadminaccounts,
    sqlserveradminaccount     => $sqlserveradminaccount,
    sqlserveradminpassword    => $sqlserveradminpassword,
    #sqlserverdbname           => $sqlserverdbname,
  }

  #-> class { 'sqlserver_install::centraladministrationdbsetup':
  #  sqlserver                   => $sqlserver,
  #  sqlserveradminaccount       => $sqlserveradminaccount,
  #  sqlserveradminpassword      => $sqlserveradminpassword,
  #  sqlserverdbnamecentraladmin => $sqlserverdbnamecentraladmin,
  #}

  #-> class { 'sqlserver_install::wbapplicationdbsetup':
  #  sqlserver              => $sqlserver,
  #  sqlserveradminaccount  => $sqlserveradminaccount,
  #  sqlserveradminpassword => $sqlserveradminpassword,
  #  sqlserverdbname        => $sqlserverdbname,
  #}

}
