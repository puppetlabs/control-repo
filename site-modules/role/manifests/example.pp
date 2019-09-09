class role::example {

  group { 'testgroup' :
    name   => ""testgroup111.
    ensure => present,
  }


  user { 'testuser1' :
    name   => "testuser111",
    ensure => present,
  }

}
