class profile::base::time (
  String $default_timezone = 'Europe/London',
  Array $ntp_servers       = ['time.goole.com'],
  Array $restrict          = ['127.0.0.1'],
  Boolean $set_timezone    = false,
) {
  class { '::ntp':
    servers  => $ntp_servers,
    restrict => $restrict,
  }
  if $set_timezone {
    class { '::timezone':
      default_timezone => $default_timezone,
    }
  }
}
