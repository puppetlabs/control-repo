class profile::pe_postgresql_management (
  $autovacuum_scale_factor   = '.01',
  $manage_postgresql_service = true,
) {

  $postgresql_service_resource_name = 'postgresqld'
  $postgresql_service_name          = 'pe-postgresql'
  $notify_postgresql_service        = $manage_postgresql_service ? {
    true    => Service[$postgresql_service_resource_name],
    default => undef,
  }

  if $manage_postgresql_service {
    service { $postgresql_service_resource_name :
      name   => $postgresql_service_name,
      ensure => running,
      enable => true,
    }
  }

  #http://www.postgresql.org/docs/9.4/static/runtime-config-autovacuum.html
  postgresql_conf { ['autovacuum_vacuum_scale_factor', 'autovacuum_analyze_scale_factor'] :
    ensure => present,
    target => '/opt/puppetlabs/server/data/postgresql/9.4/data/postgresql.conf',
    value  => $autovacuum_scale_factor,
    notify => $notify_postgresql_service,
  }

}
