#  
# profile::base_windows
#
class profile::base_windows {
  $win_sw_pkg = lookup('base_windows::win_sw_pkg')
# set default package provider on windows to chocolatey, please read https://chocolatey.org/security in 
# the future maybe use DSC instead when this is ready: 
# https://github.com/PowerShell/PackageManagementProviderResource
  include chocolatey
# set chocolatey as default package provider on Windows
  case $::operatingsystem {
    'windows':
      { Package { provider => chocolatey, } }
    default:
      { Package { provider => windows, } }
  }
  package { $win_sw_pkg:
    ensure => 'latest',
  }
# a specific version of vim I know is trusted
  package { 'vim':
    ensure => '8.0.604',
  }
# use PowerShell DSC to set timezone
  dsc_xtimezone { 'Oslo':
    dsc_timezone => 'W. Europe Standard Time',
    dsc_issingleinstance => 'yes',
  }
# use PowerShell DSC protect against wannacry :)
  dsc_windowsfeature {'FS-SMB1':
    dsc_ensure => 'absent',
    dsc_name => 'FS-SMB1',
  }
}
