class profile::base {

  accounts::user { 'joe': }

  accounts::user { 'monitoring':
    ensure     => present,
    uid        => '450',
    gid        => '10',
    managehome => false,
    locked     => true,
  }
}
