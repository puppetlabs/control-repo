# @summary This role installs a baseline of packages on Windows machines according to HIPAA guidelines
class role::windows_base_hipaa {
  include profile::baseline_hipaa
}
