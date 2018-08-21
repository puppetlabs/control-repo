# @summary This profile does some post agent install cleanup.
class profile::vro_provisioned {

  # any operating system-specific state for vro-provisioned machines.
  # it's common to change the Administrator user name on Windows, for example.
  case $::kernel {
    'Linux': {
      $agent_confdir = '/etc/puppetlabs/puppet'
    }
    'windows': {
      $agent_confdir = 'C:/ProgramData/PuppetLabs/puppet/etc'

      #exec { 'rename-Administrator':
      #  command   => '$(Get-WMIObject Win32_UserAccount -Filter "Name=\'Administrator\'").Rename("puppet#adm1n")',
      #  unless    => 'if (Get-WmiObject Win32_UserAccount -Filter "Name=\'Administrator\'") { exit 1 }',
      #  provider  => powershell,
      #}

    }
    default: {}
  }

  # ensure that the csr_attributes.yaml file containing the shared
  # autosign secret is removed on the first puppet agent run.
  file { "${agent_confdir}/csr_attributes.yaml":
    ensure => absent,
    backup => false,
  }

}
