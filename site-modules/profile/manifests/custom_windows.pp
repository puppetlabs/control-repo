class profile::custom_windows (
  Boolean $config_server   = true,
  Boolean $install_package = true,
  Boolean $deploy_iis      = true,
) {
  if $config_server {
    class { '::profile::custom_windows::config_server': }
  }
  if $install_package {
    class { '::profile::custom_windows::install_package': }
    include chocolatey
    include staging
  }
  if $deploy_iis {
    class { '::profile::custom_windows::deploy_iis': }
  }
}
