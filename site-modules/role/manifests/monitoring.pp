class role::monitoring {

    include profile::base
    include profile::tools::nfs_mount
    include profile::tools::docker_install
}
