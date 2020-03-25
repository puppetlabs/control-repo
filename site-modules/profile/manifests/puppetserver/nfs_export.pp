class profile::puppetserver::nfs_export (

) {
    class { '::nfs':
      server_enabled => true,
      nfs_v4 => true,
      nfs_v4_idmap_domain => 'peadm.01.pe',
      nfs_v4_export_root  => '/export',
      nfs_v4_export_root_clients => '*(rw,fsid=0,insecure,no_subtree_check,async,no_root_squash)',
    }

    nfs::server::export { '/opt/puppetlabs/puppet-metrics-collector':
      ensure  => 'mounted',
      clients => '*(rw,insecure,async,no_root_squash,no_subtree_check)',
    }
}
