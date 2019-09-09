class role::example {

  group { 'testgroup' :
    ensure => present,
  }


  user { 'testuser1' :
    ensure => present,
  }

}
