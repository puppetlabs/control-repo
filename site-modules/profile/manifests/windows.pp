class profile::windows (
  Boolean $base    = false,
  Boolean $account = false,
) {
  if $base {
    class { '::profile::windows::base': }
  }
  if $account {
    class { '::profile::windows::account': }
  }
}
