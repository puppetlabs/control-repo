class role::loadbalancer (
  Optional[String]   $ports1 = '80',
  Optional[String]   $ports2 = undef,
  Optional[String]    $rule1 = 'http',
  Optional[String]    $rule2 = undef,
  # String   $backendserver_name1 = '',
  # String   $backendserver_name2 = '',
  # Optional[String]   $backendserver_ipaddress1 = undef,
  # Optional[String]   $backendserver_ipaddress2 = undef,
  ) {
  include ::haproxy
  haproxy::listen { 'puppet00' :
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '8140',
  }

  haproxy::balancermember { 'haproxy' :
    listening_service => 'puppet00',
    server_names      => ['compilemaster-01.platform9.puppet.net','compilemaster-02.platform9.puppet.net'],
    ipaddresses       => ['192.168.0.8','192.168.0.10'],
    ports             => '8140',
    options           => 'check',
  }
#  haproxy::balancermember { $backendserver_name2 :
#    listening_service => 'puppetserver',
#   server_names      => $backendserver_name2,
#    ipaddresses       => $backendserver_ipaddress2,
#    ports             => $ports1,
#    options           => 'check',
#  }

}
