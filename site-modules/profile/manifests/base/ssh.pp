class profile::bootstrap::ssh (
  Hash $config_entries = {},
  String $permit_root_login = 'no',
  String $ssh_config_forward_agent = 'no',
  String $sshd_config_allowagentforwarding = 'no',
  Hash $sshd_config_match = {},
  String $sshd_config_port = '22',
  String $sshd_password_authentication = 'no'
) {
  class { '::ssh':
    config_entries                   => $config_entries,
    permit_root_login                => $permit_root_login,
    ssh_config_forward_agent         => $ssh_config_forward_agent,
    sshd_config_allowagentforwarding => $sshd_config_allowagentforwarding,
    sshd_config_match                => $sshd_config_match,
    sshd_config_port                 => $sshd_config_port,
    sshd_password_authentication     => $sshd_password_authentication,
  }
}
