class role::loadbalancer (
  Optional[String]   $ports1 = '80',
  Optional[String]   $ports2 = undef,
  Optional[String]    $rule1 = 'puppet00',
  Optional[String]    $rule2 = undef,
  Optional[String]   $backendserver_name1 = '',
  Optional[String]   $backendserver_name2 = '',
  Optional[String]   $backendserver_ipaddress1 = undef,
  Optional[String]   $backendserver_ipaddress2 = undef,
  ) {
  include ::haproxy
  haproxy::listen { $rule1 :
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '8140',
  }

  haproxy::balancermember { 'haproxy01' :
    listening_service => $rule1,
    # server_names      => ['compilemaster-01.platform9.puppet.net','compilemaster-02.platform9.puppet.net'],
    # ipaddresses       => ['192.168.0.8','192.168.0.10'],
    # ports             => '8140',
    # options           => 'check',

    server_names      => $backendserver_name1,
    ipaddresses       => $backendserver_ipaddress1,
    ports             => $ports1,
    options           => 'check',

  }

  haproxy::balancermember { 'haproxy02' :

   listening_service => $rule1,
   server_names      => $backendserver_name2,
   ipaddresses       => $backendserver_ipaddress2,
   ports             => $ports1,
   options           => 'check',
  }

}
