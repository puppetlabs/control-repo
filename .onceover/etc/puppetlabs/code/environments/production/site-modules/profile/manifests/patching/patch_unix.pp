#Provides automated patch management
class profile::patch_mgmt_nix (
  Array $blacklist = [],
  Array $whitelist = [],
  Optional[Hash] $patch_window = {
    range   => '01:00 - 14:00',
    weekday => 'Sunday',
    repeat  => 3
  }
) {
  include os_patching
  if $facts['os_patching'] {
    $updatescan = $facts['os_patching']['package_updates']
  }
  else {
    $updatescan = []
  }
  if $whitelist.count > 0 {
    $updates = $updatescan.filter |$item| { $item in $whitelist }
  } elsif $blacklist.count > 0 {
    $updates = $updatescan.filter |$item| { !($item in $blacklist) }
  } else {
    $updates = $updatescan
  }
  schedule { 'patch_window':
    * => $patch_window
  }
  if $facts['os_patching']['reboots']['reboot_required'] == true {
    Package {
      require => Reboot['patch_window_reboot']
    }
    notify { 'Reboot pending, rebooting node...':
      schedule => 'patch_window',
      notify   => Reboot['patch_window_reboot']
    }
  } else {
    Package {
      notify => Reboot['patch_window_reboot']
    }
  }
  reboot { 'patch_window_reboot':
    apply    => 'finished',
    schedule => 'patch_window'
  }
  if $updates.size > 0 {
    exec { 'Clean Yum before updates':
      command  => 'yum clean all',
      path     => '/usr/bin',
      schedule => 'patch_window'
    }
  }
  $updates.each | $package | {
    package { $package:
      ensure   => 'latest',
      schedule => 'patch_window',
      require  => Exec['Clean Yum before updates'],
    }
  }
}
