class profile::compliance::hipaa {

  case $::osfamily {
    'windows': {
      include ::profile::compliance::hipaa::windows
    }
    default: {
      include ::profile::compliance::hipaa::linux
    }
  }
}
