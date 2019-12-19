class controlm::controlm_agent::users {

  unless defined(Group['controlm']) {
    group { 'controlm':
      ensure => present,
    }
  }

  user { 'ctmagent':
    gid        => [ 'controlm'],
    home       => '/apps/bmc/ctm',
    comment    => 'ControlM Agent',
    shell      => '/bin/bash',
    password   => '*',
    managehome => true,
    require    => [Group['controlm'],File['/apps/bmc'],],
  }
  # set ownerships for /apps/bmc/ctm as needs sticky on group and install needs ctmagent to own /apps/bmc
  exec { 'set permissions on /apps/bmc/ctm':
    command => '/bin/chmod 2775 /apps/bmc/ctm',
    onlyif  => '/usr/bin/test $(/bin/find  /apps/bmc/ctm -perm 2775 | wc -l) -eq 0',
    require => User['ctmagent'],
  }

  exec { 'chown_/apps/bmc':
    command => '/bin/chown ctmagent.controlm /apps/bmc',
    unless  => '/usr/bin/test -e /apps/bmc/ctm/controlm_agent_install.hasrun',
    require => User['ctmagent'],
  }

  sudo::rule { 'controlm':
    type        => 'group',
    runas_users => 'root',
    commands    => [
      '/apps/bmc/ctm/scripts_optus/ctm.sh',
    ],
  }
}
