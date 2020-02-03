class sqlserverhenry::win_sqlserver {

  sqlserver_instance{ 'MSSQLSERVER':
     features                => ['SQL'],
     source                  => 'E:/',
     sql_sysadmin_accounts   => ['myuser'],
 }

    sqlserver::sp_configure{'Turn On Advanced':
    config_name => 'show advanced option',
    value       => 1,
    reconfigure => true,
  }

}
