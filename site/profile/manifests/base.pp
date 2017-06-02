class profile::base {


  accounts::user { 'monitoring':
    ensure     => present,
    uid        => '450',
    gid        => '450',
    managehome => false,
    locked     => true,
  }
}
