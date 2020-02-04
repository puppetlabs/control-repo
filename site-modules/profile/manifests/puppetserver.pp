class profile::puppetserver (
  Boolean $puppetserver = true,
  Boolean $authority    = false,
) {
  if $puppetserver {
    class { '::profile::puppetserver::bootstrap': }
  }
  if $authority {
    class { '::profile::puppetserver::authority': }
  }
}
