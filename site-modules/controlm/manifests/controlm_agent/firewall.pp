class controlm::controlm_agent::firewall inherits controlm::controlm_agent {


  firewall { '200  controlm tracker port hiera controlm_tracker_port':
    action => 'accept',
    proto  => 'tcp',
    dport  =>  [$tracker_port],
  }

  firewall { '210  controlm server to agent hiera controlm_server2agent_port':
    action => 'accept',
    proto  => 'tcp',
    dport  =>  [$s2a_port],
  }

}
