class profile::metrics_dashboard (

Boolean $dashboard_examples         = true,
Boolean $overwrite_dashboards       = false,
Optional[Array] $master_list        = ['peadm-01.pe'],
Optional[Array] $puppetdb_list      = ['peadm-01.pe'],
Optional[Array] $postgres_host_list = ['peadm-01.pe'],

) {
  class { 'puppet_metrics_dashboard':
    add_dashboard_examples => $dashboard_examples,
    overwrite_dashboards   => $overwrite_dashboards,
    master_list            => $master_list,
    puppetdb_list          => $puppetdb_list,
    postgres_host_list     => $postgres_host_list,
  }

  class { 'docker':
    version => 'latest',
  }

  class {'docker::compose':
    version => 'latest',
  }  
}
