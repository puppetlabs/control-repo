class profile::puppetserver (
  Boolean $puppetserver      = true,
  Boolean $authority         = false,
  Boolean $nfs_export        = false,
  Boolean $metrics_collect   = false,
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
  if $metrics_collect {
    include metrics_collector
  fi
  }
}
