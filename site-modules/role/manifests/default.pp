# @summary Default role

class role::default {

  include ::profile::base
  # include ::profile::rsyslog::client
  include ::profile_timesync::client
  # include ::profile_firewall
  # include ::profile_telegraf # depends on github.com/ncsa/puppet-profile_telegraf

}
