class controlm::controlm_agent {

  #used for the automated install file and firewall.

  #MUST HAVE THESE TWO IN HIERA, use fqdn for primary if host in diff domain.
  #controlm::controlm_agent::primary_server_host: ctmgnpappla012.optus.com.au
  #controlm::controlm_agent::server_host: ctmgnpappla012
  $server_host = hiera('controlm::controlm_agent::server_host','ctmgnpappla012')
  $primary_server_host = hiera('controlm::controlm_agent::primary_server_host','ctmgnpappla012.optus.com.au')

  $tracker_port = hiera('controlm::controlm_agent::tracker_port','7035')
  $a2s_port = hiera('controlm::controlm_agent::agent2server_port','7005')
  $s2a_port = hiera('controlm::controlm_agent::server2agent_port','7006')
  $tcp_timeout = hiera('controlm::controlm_agent::tcp_timeout','60')
  $ignore_fail = hiera('controlm::controlm_agent::ignore_fail',false)
  $force_upgrade = hiera('controlm::controlm_agent::force_upgrade',false)

  $software_version = hiera('controlm::controlm_agent::version','9.0.00-2')

  $patch_files = hiera('controlm::controlm_agent::patch_files',['PAKAI.9.0.00.100_Linux-x86_64_INSTALL.BIN','PAKAI.9.0.00.200_Linux-x86_64_INSTALL.BIN'])
  # array of patch files so 
  #  controlm::controlm_agent::patch_files:
  #     - file1
  #     - file2
  # patch files are not installed separately from main install as timing that was
  # not working.  So if we get new patches probably best to install by hand or see
  # if you can get  a separate script happening.

# also in hiera you need these, subbing PRD for GNP where needed
# isnd_linux::profiles::soe::login_accounts::groups:
#    - 'ocaus01\ACL-GNP-CTRLM-rwx-SMT-ADMIN':
#      additional_groups:
#        - controlm
#    - 'ocaus01\ACL-GNP-CTRLM-rx-SMT-SCHED':
#      additional_groups:
#        - controlm
#
#  tpiam::profiles::sudoers:
#    ocaus01aclgnpctrlmrwxsmtadmin:
#      runas_users:
#        - ctmagent
#      commands: all_commands
#    ocaus01aclgnpctrlmrxsmtsched:
#      runas_users:
#        - ctmagent
#      commands: all_commands include controlm::controlm_agent::users

  include controlm::controlm_agent::users
  include controlm::controlm_agent::packages
  include controlm::controlm_agent::files
  include controlm::controlm_agent::firewall
  include controlm::controlm_agent::install

}


