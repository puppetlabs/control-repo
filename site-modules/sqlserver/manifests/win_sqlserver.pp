class sqlserver::win_sqlserver {
  sqlserver_instance{ 'MSSQLSERVER':
  source                  => 'C:/',
  features                => ['SQL'],
  security_mode           => 'SQL',
  sa_pwd                  => 'p@ssw0rd!!',
  sql_sysadmin_accounts   => ['administrator'],
  install_switches        => {
    'TCPENABLED'          => 1,
    'SQLBACKUPDIR'        => 'C:\\MSSQLSERVER\\backupdir',
    'SQLTEMPDBDIR'        => 'C:\\MSSQLSERVER\\tempdbdir',
    'INSTALLSQLDATADIR'   => 'C:\\MSSQLSERVER\\datadir',
    'INSTANCEDIR'         => 'C:\\Program Files\\Microsoft SQL Server',
    'INSTALLSHAREDDIR'    => 'C:\\Program Files\\Microsoft SQL Server',
    'INSTALLSHAREDWOWDIR' => 'C:\\Program Files (x86)\\Microsoft SQL Server',
  }
}





}
