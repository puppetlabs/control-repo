class controlm::controlm_agent::packages inherits controlm::controlm_agent {

  package { 'ctmagent_core_clean' :
    ensure  => "$software_version",
    require => User['ctmagent'],
  }

  # the RPM does permissions, this is a backup
  exec {'software permissions' :
    command => '/bin/chown -R ctmagent:controlm /apps/bmc/software/version_9',
    onlyif  => '/usr/bin/test $(/bin/find  /apps/bmc/software/version_9/CheckReq -uid 0 | w
c -l) -gt 0',
    require => Package['ctmagent_core_clean'],
  }

}
