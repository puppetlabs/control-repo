class profile::compliance::hipaa::windows {

  # HIPAA Administrative Simplification Regulation Text
  # https://www.hhs.gov/sites/default/files/hipaa-simplification-201303.pdf?language=es

  # 164.312 Technical safeguards
  # (i) Unique user identification (Required)

  # Ensure only known accounts are on the system, purge any unmanaged accounts otherwise.
  user { 'Local Admin 1':
    ensure => present,
    groups => ['Administrators'],
  }

  user { 'Local Admin 2':
    ensure => present,
    groups => ['Administrators'],
  }

  #Purge any unmanaged users.
  purge { 'user':
    unless      => [
      [ 'name', '==', 'Administrator' ],
      [ 'name', '==', 'Guest' ],
      [ 'name', '==', 'Local Admin 1' ],
      [ 'name', '==', 'Local Admin 2' ],
    ]
  }

  # (iii) Automatic logoff (Addressable)
  # NOTE: Local Group Policy Editor tool does not show these settings as 'Enabled' but they do work.

  # Set time limit for active but idle Remote Desktop Services sessions: 10 minutes
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\MaxIdleTime':
    type   => dword,
    data   => '0x000927c0',
    notify => Reboot['after_run'],
  }

  # Set time limit for disconnected sessions: 5 minutes
  registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services\MaxDisconnectionTime':
    type   => dword,
    data   => '0x000493e0',
    notify => Reboot['after_run'],
  }

  # Reboot is required for registry keys above if they are remediated/altered.
  reboot { 'after_run':
    apply       => finished,
  }
}
