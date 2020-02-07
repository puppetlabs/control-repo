class profile::custom_windows::add_user {

  profile::custom_windows::define_user { 'myuser':

    user_name     => 'myuser',
    user_group    => 'mygroup',
    user_groups   => ['BUILTIN\\Administrators', 'BUILTIN\\Users'],
    user_home     => "C:\\Users\\myuser",
    user_password => 'puppet',
    ensure        => 'present',
    manage_home   => true,
    user_file     => 'myfile',
  }

    acl { 'C:\\Users\\myuser\myfile':
      permissions => [
      { identity => myuser, rights => ['read','execute'] },
      { identity => mygroup, rights => ['read'] }
     ],
    }

    registry::value { 'Enable IE ESC':
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
