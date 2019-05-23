class sqlserver_install::wbapplicationdbsetup (
  String $sqlserver                   = "FCL-PUP-V804",
  String $sqlserverinstancename       = "MSSQLSERVER",
  String $sqlserveradminaccount       = "sa",
  String $sqlserveradminpassword      = "Passw0rd1",
  String $webappserver                = "FCL-PUP-V805",
  String $sqlserverdbname             = "WALLSstgSit",
  String $websitename                 = "WALLSstgSit",
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

  -> file { 'C:\tmp\sqlwallsinstall\script_walls_preparation.sql':
    ensure  => file,
    content => template("${module_name}/script_walls_preparation.sql.erb"),
    require => File['C:\tmp\sqlwallsinstall'],
  }

  -> exec { 'Deploy wbapplicationsetup sql database - Preparation':
    command   => "Import-Module SqlPs;Invoke-Sqlcmd -ServerInstance ${sqlserver} -username ${sqlserveradminaccount} -Password ${sqlserveradminpassword} -InputFile \"C:\\tmp\\sqlwallsinstall\\script_walls_preparation.sql\" | out-File -filepath \"C:\\tmp\\sqlwallsinstall\\script_walls_preparation_output.txt\"",
    provider  => 'powershell',
    #logoutput => 'on_failure',
    onlyif    => 'if ((Test-Path c:\tmp\sqlwallsinstall\script_walls_preparation_output.txt) -ne \'True\') {exit 0} Else {exit 1}',
  }

  -> exec { 'sleep before running next script - After Walls Preparation':
    command  => 'Start-Sleep -s 60',
    provider => 'powershell',
  }

  -> file { 'C:\tmp\sqlwallsinstall\script_walls_data.sql':
    ensure  => file,
    content => template("${module_name}/script_walls_data.sql.erb"),
    require => File['C:\tmp\sqlwallsinstall'],
  }

  -> exec { 'Deploy wbapplicationsetup sql database - Data':
    command   => "Import-Module SqlPs;Invoke-Sqlcmd -ServerInstance ${sqlserver} -username ${sqlserveradminaccount} -Password ${sqlserveradminpassword} -InputFile \"C:\\tmp\\sqlwallsinstall\\script_walls_data.sql\" | out-File -filepath \"C:\\tmp\\sqlwallsinstall\\script_walls_data_output.txt\"",
    provider  => 'powershell',
    #logoutput => 'on_failure',
    onlyif    => 'if ((Test-Path c:\tmp\sqlwallsinstall\script_walls_data_output.txt) -ne \'True\') {exit 0} Else {exit 1}',
  }

  -> exec { 'sleep before running next script - After Walls Data':
    command  => 'Start-Sleep -s 60',
    provider => 'powershell',
  }

}
