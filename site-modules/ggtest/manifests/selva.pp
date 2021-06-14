# == Class: profile::firewall
#
# Class to configure the firewall on various platforms
#
class ggtest::selva (
  # Class parameters are populated from External(hiera)/Defaults/Fail
  Boolean $enable = false,
  String $module = 'firewall',
){
  if $facts['os']['family'] == 'RedHat' {
    # firewalld - do not use this for new config
    if $module == 'firewalld' {
      if $enable {
        class { 'firewalld': }
      }
      else {
        class { 'firewalld':
          service_ensure => 'stopped',
          service_enable => false,
        }
      }
    }
    else {
      # Use this for new config
      if $enable {
        class { 'profile::firewall::start': }
        -> class { 'profile::firewall::app_rules': }
        -> class { 'profile::firewall::finish': }
      }
      else {
        class { 'profile::firewall::stop': }
      }
    }
  }

}
