class profile::puppetserver::nfs_export (
   
  $domain         = $::domain,
  $server_enabled = true, 
  $export_root    = '/export', 
  $nfs_v4         = 'true',
  $server_export  = '/opt/puppetlabs/puppet-metrics-collector',
  $export_mount   = 'mounted',

) {
    class { '::nfs':
      server_enabled => $server_enabled,
      nfs_v4 => $nfs_v4,
      nfs_v4_idmap_domain => $domain,
      nfs_v4_export_root  => '$export_root',
      nfs_v4_export_root_clients => '*(rw,fsid=0,insecure,no_subtree_check,async,no_root_squash)',
    }

    nfs::server::export { $server_export:
      ensure  => $export_mount,
      clients => '*(rw,insecure,async,no_root_squash,no_subtree_check)',
    }
}
