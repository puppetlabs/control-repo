class profile::custom_windows (
  Boolean $config_server = true,
) {
  if $config_server {
    class { '::profile::custom_windows::config_server': }
    include chocolatey
  }
}
