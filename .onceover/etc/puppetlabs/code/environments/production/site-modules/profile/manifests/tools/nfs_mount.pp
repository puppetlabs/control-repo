class profile::tools::nfs_mount (
  $server = 'puppet',
) {
  class { '::nfs':
    server_enabled => false,
    client_enabled => true,
    nfs_v4_client => false,
    nfs_v4_idmap_domain => $::domain,
   }

  nfs::client::mount { '/mnt/puppet-metrics-collector':
    server => $server,
    share => '/export/puppet-metrics-collector',
  }
}
