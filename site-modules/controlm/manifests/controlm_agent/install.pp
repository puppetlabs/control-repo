class controlm::controlm_agent::install inherits controlm::controlm_agent {


# set up /etc/services

  augeas { 'controlm':
  context => '/files/etc/services',
  changes => [
    "set service-name[port = '${s2a_port}'][protocol = 'udp'] ctmagent",
#    "set service-name[port = '${s2a_port}'][protocol = 'udp'][#comment 'Control-M server2agent']",
    "set service-name[port = '${s2a_port}'][protocol = 'tcp'] ctmagent",
#    "set service-name[port = '${s2a_port}'][protocol = 'tcp'][#comment 'Control-M server2agent']",
    "set service-name[port = '${a2s_port}'][protocol = 'udp'] ctmagent",
#    "set service-name[port = '${a2s_port}'][protocol = 'udp']/ #comment 'Control-M agent2servr'",
    "set service-name[port = '${a2s_port}'][protocol = 'tcp'] ctmagent",
#    "set service-name[port = '${a2s_port}'][protocol = 'tcp']/ #comment 'Control-M agent2server'",
    ],
  }


  # use shellscript and sudo as running the install direct as user ctmagent gives HOME errors plus we get errors in the log file
  # also does patches as can't get the patch script running after it for some reason
  # patch names need to be in hiera see controlm_agent.pp
  exec { 'controlm_agent_install':
    command => '/apps/bmc/ctm/controlm_agent_install.sh > /apps/bmc/ctm/controlm_agent_install.log',
    creates => '/apps/bmc/ctm/controlm_agent_install.hasrun',
    require => [User['ctmagent'],Package['ctmagent_core_clean'],File['/apps/bmc/ctm/ctm_silentinstall_optus.xml','/apps/bmc/ctm/controlm_agent_install.sh'],Exec['chown_/apps/bmc'],],
    timeout => 1800,
  }

  case $::os['release']['major']{
     '6': {
            service { 'ctm.sh':
              ensure    => running,
              enable    => true,
              hasstatus => false,
              status    => '/bin/ps -ef | /bin/grep /apps/bmc/ctm/exe/p_ctm | /bin/grep -v grep',
              require   => [File['/etc/rc.d/init.d/ctm.sh'],Exec['controlm_agent_install'],]
            }
      }
      '7': {

            service { 'ctm.sh':
              enable    => false,
            }

            service { 'ctm':
              ensure    => running,
              enable    => true,
              hasstatus => false,
              status    => '/bin/ps -ef | /bin/grep /apps/bmc/ctm/exe/p_ctm | /bin/grep -v grep',
              require   => [File['/etc/rc.d/init.d/ctm'],Exec['controlm_agent_install']]
            }

      }
      default: {fail "Unsupported Major version ${::os['release']['major']} detected"}
  }
}
