class profile::custom_windows::config_server (

  $user_name     = 'myuser',
  $user_group    = 'mygroup',
  $user_groups   = ['BUILTIN\Administrators', 'BUILTIN\Users'],
  $user_home     = "C:/Users/myuser",
  $user_password = 'puppet',
  $ensure        = 'present',
  $manage_home   = true,
  $user_dir     = 'mydir',

) {

  profile::custom_windows::define_user { 'myuser':

    user_name     => $user_name,
    user_group    => $user_group,
    user_groups   => $user_groups,
    user_home     => $user_home,
    user_password => $user_password,
    ensure        => $ensure,
    manage_home   => $manage_home,
    user_dir      => $user_dir,
  }

  acl { "${user_home}/${user_dir}":

    permissions => [
    { identity => $user_name, rights => ['read','execute'] },
    { identity => $user_group, rights => ['read'] }
   ],
  }

  registry::value { 'Enable IEESC':

    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}',
    value => 'IsInstalled',
    data  => '1',
    type  => 'dword',
  }

  registry::value { 'Enable shutdown tracker':

    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability',
    value => 'ShutdownReasonOn',
    data  => '1',
    type  => 'dword',
  }

 registry::value { 'Enable shutdown tracker UI':

   key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability',
   value => 'ShutdownReasonUI',
   data  => '1',
   type  => 'dword',
 }
}
