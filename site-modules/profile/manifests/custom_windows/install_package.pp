class profile::custom_windows::install_package (

  String $package          = 'undef',
  String $version          = 'undef',
  String $package_provider = 'chocolatey',
  String $choco_provider   = 'windows',
  String $install_dir      = $profile::custom_windows::config_server::user_home,

) {

  chocolateysource {'custom_source':
    ensure   => present,

    location => 'c:\packages',
    provider => $choco_provider,
  }

  chocolateyfeature {'allowEmptyChecksums':	
    ensure   => enabled,
    provider => $choco_provider,
  }

  chocolateyconfig {'cacheLocation':
    value    => 'c:\ProgramData\choco-cache',
    provider => $choco_provider,
  }

  package { 'unzip':
    ensure            => '6.0',
    provider          => $package_provider,
  }

  class { 'staging':
    path      => 'C:/tmp',
  }

  staging::file { 'master.zip':
    source  => 'puppet:///custom_files/master.zip',
  }

  staging::extract { 'master.zip':
    target     => "${install_dir}/downloads",
    #unless     => '7z',
    unless     => 'cmd.exe /c type C:\tmp\7zip',
    require    => Staging::File['master.zip'],
  }

  exec { '7z1900-x64':
    cwd         => "${install_dir}/downloads",
    command     => 'cmd.exe /c C:\Users\myuser\Downloads\7z1900-x64.exe',
    path        => $::path,
    unless     => 'cmd.exe /c type C:\tmp\7zip',
    require    => Staging::Extract['master.zip'],
  }
  
  file { 'C:/tmp/7zip':
    ensure  => present,
    content => installed,
    require => Exec['7z1900-x64'],
  }

  reboot { 'post_exec':
    apply     => finished,
    subscribe => File['C:/tmp/7zip'],
  }
}
