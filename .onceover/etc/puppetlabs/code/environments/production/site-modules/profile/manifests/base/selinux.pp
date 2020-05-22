class profile::base::selinux (
  String $mode = 'disabled',
) {
  class { '::selinux':
    mode => $mode,
  }
}
