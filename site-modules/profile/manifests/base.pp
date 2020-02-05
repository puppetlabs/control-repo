class profile::base (
  Boolean $firewall = false,
  Boolean $time     = false,
  Boolean $repos    = false,
  Boolean $resolv   = false,
  Boolean $ssh      = true,
  Boolean $selinux  = true,
  Boolean $motd     = true,
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
}
