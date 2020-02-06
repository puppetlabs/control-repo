class os::win {
  if $osfamily == 'windows' {
    include role::custom_windows
  }
}
