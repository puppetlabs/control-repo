# @summary Default role

class role::time_master {

  include ::profile::base
  # include ::profile::rsyslog::client
  include ::profile_timesync::server
  # include ::profile_firewall
  # include ::profile_telegraf # depends on github.com/ncsa/puppet-profile_telegraf

}
