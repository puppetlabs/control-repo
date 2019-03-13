#
class profile::sample_website::windows (
    $doc_root,
    $webserver_port,
) {
  require ::profile::iis

  # configure iis
  iis_application_pool { 'sample_website':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

  iis_site { $::fqdn:
    ensure          => 'started',
    physicalpath    => $doc_root,
    applicationpool => 'sample_website',
    bindings        => [
      {
        'bindinginformation' => '*:80:',
        'protocol'           => 'http',
      },
    ],
    require         => File[$website_source_dir],
  }

  windows_firewall::exception { 'IIS':
    ensure       => present,
    direction    => 'in',
    action       => 'allow',
    enabled      => true,
    protocol     => 'TCP',
    local_port   => $webserver_port,
    display_name => 'HTTP Inbound',
    description  => 'Inbound rule for HTTP Server',
  }

  # deploy website
  $website_source_dir  = lookup('website_source_dir')

  file { $website_source_dir:
    ensure  => directory,
    path    => $doc_root,
    source  => $website_source_dir,
    recurse => true,
  }

  file { "${doc_root}/index.html":
    ensure  => file,
    content => epp('profile/index.html.epp'),
  }

}
