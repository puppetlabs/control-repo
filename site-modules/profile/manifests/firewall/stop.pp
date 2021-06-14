# == Class: profile::firewall::stop
#
# Turn off all firewall management.
#
class profile::firewall::stop {

  class { 'firewall':
    ensure => 'stopped',
    enable => false,
  }

}
