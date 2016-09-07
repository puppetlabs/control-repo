class profile::base {

  #the base profile should include component modules that will be on all nodes

  class { '::ntp':
  servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
  }

  network::mroute { 'eth0':
    routes => {
      '192.168.2.0/24' => '192.168.1.1',
      '80.81.82.0/16'  => 'eth0',
    }
  }

}
