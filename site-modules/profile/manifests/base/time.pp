# == Class: profiles::bootstrap::time
#
# This class can be used install time components.
#
# === Examples
#
# @example when declaring the time class
#  class { '::profiles::bootstrap::time': }
#
# === Parameters
#
# @param default_timezone Timezone for this node.
# @param ntp_servers      List of ntp servers.
# @param restrict         Restrict to this list.
# @param set_timezone     Configure the timezone.
class profile::base::time (
  String $default_timezone = 'Europe/Amsterdam',
  Array $ntp_servers       = ['time.google.com'],
  Array $restrict          = [],
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
