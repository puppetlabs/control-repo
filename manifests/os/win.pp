class os::win {
  if $facts[osfamily] == 'windows' {
    include role::custom_windows
  }
}
