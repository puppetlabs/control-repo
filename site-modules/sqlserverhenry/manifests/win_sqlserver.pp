class sqlserverhenry::win_sqlserver {
  sqlserver_instance{ 'MSSQLSERVER':
      features                => ['SQL'],
      source                  => 'C:/SQLEXPR_x64_ENU.exe',
      sql_sysadmin_accounts   => ['myuser'],
  }

}
