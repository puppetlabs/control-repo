class profile::puppetserver (
  Boolean $puppetserver      = true,
  Boolean $authority         = false,
  Boolean $nfs_export        = true,
) {
  if $puppetserver {
    class { '::profile::puppetserver::bootstrap': }
  }
  if $authority {
    class { '::profile::puppetserver::authority': }
  }
  if $nfs_export {
    class { '::profile::puppetserver::nfs_export': }
  }
}
