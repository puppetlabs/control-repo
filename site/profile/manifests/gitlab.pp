class profile::gitlab {

  file { ['/etc/gitlab', '/etc/gitlab/ssl'] :
    ensure => directory,
  }

  file { "/etc/gitlab/ssl/${::fqdn}.key" :
    ensure => file,
    source => "${::settings::privatekeydir}/${::trusted['certname']}.pem",
    notify => Exec['gitlab_reconfigure'],
  }

  file { "/etc/gitlab/ssl/${::fqdn}.crt" :
    ensure => file,
    source => "${::settings::certdir}/${::trusted['certname']}.pem",
    notify => Exec['gitlab_reconfigure'],
  }

  class { 'gitlab':
    external_url => hiera( 'gms_server_url', "https://${::fqdn}") ,
    require      => File["/etc/gitlab/ssl/${::fqdn}.key", "/etc/gitlab/ssl/${::fqdn}.key"],
  }

}
