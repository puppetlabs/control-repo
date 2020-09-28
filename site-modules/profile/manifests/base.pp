class profile::base (
  Boolean $firewall = false,
  Boolean $time     = true,
  Boolean $repos    = false,
  Boolean $resolv   = false,
  Boolean $ssh      = false,
  Boolean $selinux  = false,
  Boolean $motd     = true,
  Boolean $oracle   = false
) {
  if $motd {
    class { '::motd': }
  }
  if $firewall {
    class { '::profile::base::firewall': }
  }
  if $time {
    class { '::profile::base::time': }
  }
  if $repos {
    class { '::profile::base::repositories': }
  }
  if $resolv {
    class { '::profile::base::resolv': }
  }
  if $ssh {
    class { '::profile::base::ssh': }
  }
  if $selinux {
    class { '::profile::base::selinux': }
  }
  if $oracle {
    class { '::profile::app::oracle': }
  }
}
