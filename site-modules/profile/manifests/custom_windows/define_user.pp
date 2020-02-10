define profile::custom_windows::define_user (

  String $user_name,
  String $ensure,
  String $user_group,
  Optional[Array] $user_groups,
  String $user_password,
  String $user_dir,
  String $user_home,
  Boolean $manage_home,

) {
  file { "${user_home}/${user_dir}":
    ensure  => directory,
    owner   => $user_name,
    require => User[$user_name], 
  }

  user { $user_name: 
    ensure     => $ensure,
    password   => $user_password,
    groups     => $user_group,
    managehome => $manage_home,
    home       => "C:/Users/$user_name",
    require    => Group[$user_group],
  }

  group { $user_group:
    ensure  => $ensure,
  }  
}
