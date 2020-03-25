class profile::puppetserver (
  Boolean $puppetserver      = true,
  Boolean $authority         = false,
  Boolean $metrics_server    = true,
) {
  if $puppetserver {
    class { '::profile::puppetserver::bootstrap': }
  }
  if $authority {
    class { '::profile::puppetserver::authority': }
  }
  if $metrics_server {
    include puppet_metrics_collector
    include puppet_metrics_collector::system
    include puppet_metrics_dashboard::profile::master::postgres_access
  }
}
