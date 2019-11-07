if $::kernel == 'windows' {
  user { 'ajuric':
    ensure => present,
    password => 'Pass!3w0rd',
    groups => 'test2',
    auth_membership => inclusive
  }
  group { 'demo group':
    name => 'test2',
    ensure => present,
    auth_membership => false,
  }
  local_security_policy { 'Log on as a service':
    ensure => present,
    policy_value => 'cloudbase-init,NT_SERVICE\ALL_SERVICES,ajuric',
  }
  exec { 'TJURIC-WIN2019':
  command   => 'C:\Users\Admin\test1.ps1',
  provider  => powershell,
  logoutput => true,
  }
}
