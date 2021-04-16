# @summary xcatmaster and puppetmaster
class role::xcatmaster_puppetmaster {

  include ::profile::base
  include ::profile::rsyslog::relay
  include ::profile::squid_proxy
  include ::profile::sssd
  include ::profile_allow_ssh_from_cerberus
  include ::profile_timesync::server
  include ::profile_docker
  include ::profile_puppet_master
  include ::profile_xcat::master

}
