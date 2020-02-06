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
}
