class profile::consul::server {
  package { 'unzip':
    ensure => latest,
  }
  class { '::consul':
    version => '1.6.0',
    config_hash => {
      'bootstrap_expect' => 3,
      'data_dir' => '/opt/consul',
      'datacenter' => 'NTNU',
      'log_level' => 'INFO',
      'node_name' => $facts['hostname'],
      'server' => true,
      'retry_join' => [ $::serverip ],
    },
    require => Package['unzip'],
  }
}
