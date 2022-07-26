class sqlserverhenry::win_sqlserver {
  sqlserver_instance{ 'MSSQLSERVER':
      features                => ['SQL'],
      source                  => 'C:\\SQLEXPR_x64_ENU',
      sql_sysadmin_accounts   => ['administrator'],
  }

}
