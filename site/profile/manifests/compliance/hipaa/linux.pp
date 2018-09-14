class profile::compliance::hipaa::linux {

  # HIPAA Administrative Simplification Regulation Text
  # https://www.hhs.gov/sites/default/files/hipaa-simplification-201303.pdf?language=es

  # 164.312 Technical safeguards
  # (i) Unique user identification (Required)

  # Ensure only known accounts are on the system, purge any unmanaged accounts otherwise.
  resources {'user':
    purge              => true,
    unless_system_user => true,
    unless_uid         => ['1010'],
  }

  # (iii) Automatic logoff (Addressable)
  # Set time limit for active but idle ssh sessions: 10 minutes
  # Set login grace time to 60
  class{'::ssh':
    permit_root_login            => 'no',
    sshd_client_alive_count_max  => '10',
    sshd_client_alive_interval   => '60',
    sshd_config_login_grace_time => '60',
  }

  # Add Auditd configuration
  class{'::auditd':
    main_rules => [
      '-a always,exit -F path=/etc/passwd -F perm=wa -F key=accounts',
      '-a always,exit -F path=/etc/gshadow -F perm=wa -F key=accounts',
    ],
  }



}
