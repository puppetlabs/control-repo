class profile::base {


  accounts::user { 'monitoring':
    # ensure     => absent,
    # uid        => '450',
    # gid        => '450',
    managehome => false,
    # locked     => true,
  }
}
