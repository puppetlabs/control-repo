class sqlserverhenry::win_sqlserver {

  sqlserver_instance{ 'MSSQLSERVER':
     features                => ['SQL'],
     source                  => 'E:/',
     sql_sysadmin_accounts   => ['myuser'],
 }

 sqlserver::config { 'MSSQLSERVER':
   admin_login_type => 'WINDOWS_LOGIN'
 }


    sqlserver::sp_configure{'Turn On Advanced':
    config_name => 'show advanced option',
    value       => 1,
    reconfigure => true,
  }

}
