# @summary Default role

class role::default {
  include ::profile::base
  # include ::profile::rsyslog::client
  include ::profile_additional_packages
  # include ::profile_chrony::client
  # include ::profile_firewall
  # include ::profile_telegraf # depends on github.com/ncsa/puppet-profile_telegraf

}
