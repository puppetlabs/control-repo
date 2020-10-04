# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::base_linux
#
# profile::base:linux
#


class profile::base_linux {



  $root_ssh_key = lookup('base_linux::root_ssh_key')
  $linux_sw_pkg = lookup('base_linux::linux_sw_pkg')
# careful when configuring ntp to avoid misuse (opening for DDOS)
  class { 'ntp':
    servers => [ 'ntp.ntnu.no' ],
    restrict => [
      'default kod nomodify notrap nopeer noquery',
      '-6 default kod nomodify notrap nopeer noquery',
    ],
  }
  class { 'timezone':
    timezone => 'Europe/Oslo',
  }
  package { $linux_sw_pkg:
    ensure => latest,
  }

 package { 'binclock':
    ensure => latest,
  }

# root@manager should be able to ssh without password to all
  file { '/root/.ssh':
    owner => 'root',
    group => 'root',
    mode => '0700',
    ensure => 'directory',
  }
  ssh_authorized_key { 'root@manager':
    user => 'root',
    type => 'ssh-rsa',
    key => $root_ssh_key,
    require => File['/root/.ssh'],
  }
}
