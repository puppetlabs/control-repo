class role::loadbalancer (
  Optional[String]   $ports1 = '80',
  Optional[String]   $ports2 = undef,
  Optional[String]   $rule1 = 'puppet00',
  Optional[String]   $rule2 = undef,
  Optional[String]   $backendserver_name1 = '',
  Optional[String]   $backendserver_name2 = '',
  Optional[String]   $backendserver_ipaddress1 = undef,
  Optional[String]   $backendserver_ipaddress2 = undef,
  ) {

  include ::haproxy
  #haproxy::listen { $rule1 :
  class { 'haproxy::listen' :
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => $ports1,
  }


  #haproxy::balancermember { 'member1' :
  class { 'haproxy::balancermember' :
    listening_service => $rule1,
    server_names      => $backendserver_name1,
    ipaddresses       => $backendserver_ipaddress1,
    ports             => $ports1,
    options           => 'check',

  }

  #haproxy::balancermember { 'haproxy02' :
  class { 'haproxy::balancermember' :
   listening_service => $rule1,
   server_names      => $backendserver_name2,
   ipaddresses       => $backendserver_ipaddress2,
   ports             => $ports1,
   options           => 'check',
  }

#pending Improvement, possible areas: Array Input with multipal ports




}
