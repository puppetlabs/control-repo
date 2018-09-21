# @summary This profile installs unzip and git as part of the Linux baseline
class profile::linux_baseline {

  include ntp  

  package { 'unzip':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

}
