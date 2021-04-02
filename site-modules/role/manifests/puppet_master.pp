# @summary Puppet_master role

class role::puppet_master {

  include ::profile::base
  include ::profile_puppet_master
  include ::profile_monitoring::telegraf_ping_check
  include ::profile_monitoring::telegraf_sslcert_check
  include ::profile_monitoring::telegraf_website_check

}
