class profile::tools::docker_install (
  $docker_version  = '19.03',
  $compose_version = '1.24',
) {
  class { 'docker':
    ensure  => present,
    version => '$docker_version',
  }

 class {'docker::compose':
  ensure  => present,
  version => '$compose_version',
  }

}
