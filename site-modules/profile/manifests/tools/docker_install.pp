class profile::tools::docker_install (
  $docker_version  = '19.03',
  $compose_version = '1.24',
) {
  yumrepo { 'docker':
    ensure   => 'present',
    baseurl  => 'https://download.docker.com/linux/centos/7/x86_64/stable',
    descr    => 'Docker',
    gpgcheck => 'True',
    gpgkey   => 'https://download.docker.com/linux/centos/gpg',
}

 class {'docker::compose':
  ensure  => present,
  version => '$compose_version',
  }
}
