class profile::base (
  Boolean $firewall = false,
  Boolean $lvm      = false,
  Boolean $ntp      = false,
  Boolean $puppet   = false,
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
  if $lvm {
    class { '::profile::base::lvm': }
  }
  if $ntp {
    class { '::profile::base::time': }
  }
  if $puppet {
    class { '::profile::base::puppet': }
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
