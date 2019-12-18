class role::example {

  group { 'testgroup' :
    name   => "testgroup1112345",
    ensure => present,
  }


  user { 'testuser1' :
    name   => "testuser111",
    ensure => present,
  }

}
