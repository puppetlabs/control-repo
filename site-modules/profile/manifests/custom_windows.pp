class profile::custom_windows (
  Boolean $custom_account = false,
  if $custom_account {
    class { '::profile::windows::custom_account': }
  }
}
