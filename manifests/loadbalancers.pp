node 'node4' {
  include ::haproxy
  haproxy::listen { 'lb-01':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  haproxy::balancermember { 'node1':
    listening_service => 'lb-01',
    server_names      => 'node1',
    ipaddresses       => '172.18.0.2',
    ports             => '8080',
    options           => 'check',
  }
  haproxy::balancermember { 'node2':
    listening_service => 'lb-01',
    server_names      => 'node2',
    ipaddresses       => '172.18.0.5',
    ports             => '8080',
    options           => 'check',
  }
}