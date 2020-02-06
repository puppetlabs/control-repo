class profile::custom_windows (
  Boolean $add_user = true,
) {
  if $add_user {
    class { '::profile::custom_windows::add_user': }
  }
}
