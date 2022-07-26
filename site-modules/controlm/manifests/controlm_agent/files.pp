class controlm::controlm_agent::files inherits controlm::controlm_agent {

# Directories
  unless defined(File['/apps']) {
    file { [ '/apps', ]:
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
  }

  file { [ '/apps/bmc',]:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/apps'],
  }
  file { [ '/apps/bmc/software','/apps/bmc/software/version_9/','/apps/bmc/software/version_9/fixes' ]:
    ensure  => 'directory',
    owner   => 'ctmagent',
    group   => 'controlm',
    mode    => '0755',
    require => File['/apps/bmc'],
  }

# scripts_optus

  file { ['/apps/bmc/ctm/scripts_optus']:
    ensure  => directory,
    owner   => 'ctmagent',
    group   => 'controlm',
    mode    => '0775',
    require => User['ctmagent'],
  }

  file { '/apps/bmc/ctm/scripts_optus/sleep.sh':
    ensure  => file,
    owner   => 'ctmagent',
    group   => 'controlm',
    mode    => '0755',
    source  => 'puppet:///modules/controlm/sleep.sh',
    require => [File['/apps/bmc/ctm/scripts_optus'],User['ctmagent'],],
  }

  file { '/apps/bmc/ctm/scripts_optus/ctm.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => 'puppet:///modules/controlm/ctm.sh',
    require => File['/apps/bmc/ctm/scripts_optus'],
  }

  case $::os['release']['major']{
     '6': {
            file { '/etc/rc.d/init.d/ctm.sh':
              ensure  => link,
              target  => '/apps/bmc/ctm/scripts_optus/ctm.sh',
              owner   => 'root',
              group   => 'root',
              require => File['/apps/bmc/ctm/scripts_optus/ctm.sh'],
            }
      }
      '7': {

            file { '/etc/rc.d/init.d/ctm.sh':
              ensure  => absent,
            }

            file { '/etc/rc.d/init.d/ctm':
              ensure  => file,
              owner   => 'root',
              group   => 'root',
              mode    => '0755',
              source  => 'puppet:///modules/controlm/ctm.sh',
              notify  => Exec['systemctl reload daemon for Control-M agent']
            }
            
            exec{'systemctl reload daemon for Control-M agent':
              path        => $::path,
              command     => 'systemctl daemon-reload',
              refreshonly => true,
            }

      }
      default: {fail "Unsupported Major version ${::os['release']['major']} detected"}
  }

#ctm/scripts

#  file { '/apps/bmc/ctm/scripts':
#    ensure  => link,
#    target  => '/apps/bmc/software/version_9/ctm/scripts',
#    owner   => 'root',
#    group   => 'root',
#    require => Package['ctmagent_core_clean'],
#  }

# install scripts

  file { '/apps/bmc/ctm/ctm_silentinstall_optus.xml':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('controlm/agent_install.erb'),
    require => User['ctmagent'],
  }

  file { '/apps/bmc/ctm/controlm_agent_install.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('controlm/controlm_agent_install.erb'),
    require => User['ctmagent'],
  }


#  need to check status method and also if we need restart check.
# this should be in the install Iguess
#  service { 'ctm.sh':
#    ensure    => running,
#    enable    => true,
#    hasstatus => false,
#    status    => '',
#    start     => '',
#    stop      => '',
#    subscribe => [
#    ],
#    require => '/etc/rc.d/init.d/ctm.sh',
#  }

# profile scripts
  file { '/etc/profile.d/controlm.csh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/controlm/controlm.csh',
  }

  file { '/etc/profile.d/controlm.sh':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/controlm/controlm.sh',
  }

}
