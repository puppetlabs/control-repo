user { 'ajuric':
  ensure => present,
  password => 'Pass!3w0rd',
  groups => 'test2',
  auth_membership => inclusive
}
group { 'demo group':
  name => 'test2',
  ensure => present,
  members => ['ajuric'],
  auth_membership => false,
}
