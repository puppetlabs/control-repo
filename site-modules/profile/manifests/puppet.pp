class profile::puppet (
  Boolean $puppetserver = true,
  Boolean $authority    = true,
) {
  if $puppetserver {
    class { '::profile::puppet::puppetserver': }
  }
  if $authority {
    class { '::profile::puppet::authority': }
  }
}
