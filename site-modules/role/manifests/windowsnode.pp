class role::windowsnode {

  group { 'testgroup' :
    ensure => present,
  }


  user { 'testuser1' :
    ensure => present,
  }



}
