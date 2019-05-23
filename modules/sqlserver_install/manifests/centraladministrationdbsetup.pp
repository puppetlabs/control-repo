class sqlserver_install::centraladministrationdbsetup (
  String $sqlserver                   = "FCL-PUP-V804",
  String $sqlserverinstancename       = "MSSQLSERVER",
  String $sqlserveradminaccount       = "sa",
  String $sqlserveradminpassword      = "Passw0rd1",
  String $webappserver                = "FCL-PUP-V805",
  String $sqlserverdbname             = "CentralAdministration",
  String $websitename                 = "CentralAdministration",
  String $wallswebsitename            = "WALLSstgSit",
  String $apiwebsitename              = "APIService",
) {

  ############################################################################
  # Creating Walls Database(s)                                               #
  ############################################################################

  sqlserver::database{ $sqlserverdbname:
    instance => $sqlserverinstancename,
    require  => Sqlserver_instance[$sqlserverinstancename],
  }

  ############################################################################
  # Populate Walls Database(s)                                               #
  ############################################################################

  -> file { 'C:\tmp\sqlwallsinstall\script_central.sql':
    ensure  => file,
    content => template("${module_name}/script_central.sql.erb"),
    require => File['C:\tmp\sqlwallsinstall'],
  }

  -> exec { 'Deploy Central Admin sql database':
    command  => "Import-Module SqlPs;Invoke-Sqlcmd -ServerInstance ${sqlserver} -username ${sqlserveradminaccount} -Password ${sqlserveradminpassword} -InputFile \"C:\\tmp\\sqlwallsinstall\\script_central.sql\" | out-File -filepath \"C:\\tmp\\sqlwallsinstall\\script_central_output.txt\"",
    provider => 'powershell',
    #logoutput => true,
    onlyif   => 'if ((Test-Path c:\tmp\sqlwallsinstall\script_central_output.txt) -ne \'True\') {exit 0} Else {exit 1}',
  }

  -> exec { 'sleep before running next script - After Central Administration':
    command  => 'Start-Sleep -s 30',
    provider => 'powershell',
  }

}
