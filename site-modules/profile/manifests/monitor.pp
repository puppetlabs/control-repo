class profile::monitoring (
  Boolean $docker_install = false,
  Boolean $nfs_mount      = false,
) {
  if $docker_install {
    class { '::profile::tools::docker_install': }
  }
  if $nfs_mount {
    class { '::profile::tools::nfs_mount': }
  }
}
