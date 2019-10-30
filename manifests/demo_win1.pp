group { 'demo group':
  name => 'test2',
  ensure => present,
  members => ['petagentadmin','petriuser1'],
  auth_membership => false,
}

user { 'ajuric1':
  ensure => present,
  password => 'Pass!3w0rd',
  groups => 'test2',
  auth_membership => inclusive
}
