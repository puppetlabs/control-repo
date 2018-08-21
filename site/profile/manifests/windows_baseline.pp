# @summary This profile installs unzip and git as part of the Windows baseline
class profile::windows_baseline {

  include chocolatey

  package { 'unzip':
    ensure   => installed,
    provider => chocolatey,
  }

  package { 'git':
    ensure   => installed,
    provider => chocolatey,
  }

}
