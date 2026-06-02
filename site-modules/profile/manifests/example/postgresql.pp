# An example profile installing PostgreSQL and managing its service.
#
# @param manage_package Whether to manage the PostgreSQL package (default: true)
# @param manage_service Whether to manage the PostgreSQL service (default: true)
# @param version The version of PostgreSQL to install (default: 'latest')
class profile::example::postgresql (
  Boolean $manage_package = true,
  Boolean $manage_service = true,
  String $version = 'latest',
) {
  if $manage_package {
    package { 'postgresql':
      ensure => $version,
    }
  }

  if $manage_service {
    service { 'postgresql':
      ensure => 'running',
      enable => true,
    }
  }

  if $manage_package and $manage_service {
    # Notify the service to restart if the package is changed
    Package['postgresql'] ~> Service['postgresql']
  }
}
