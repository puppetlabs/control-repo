# @summary This role installs a baseline of packages on Windows machines
class role::windows_base {
  include profile::windows_baseline
}
