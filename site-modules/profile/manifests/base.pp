# Include basic profile classes
class profile::base {

  include ::profile_additional_packages
  include ::profile_additional_yumrepos
  include ::profile_allow_ssh_from_bastion
  include ::profile_dns_cache
#  include ::profile_email
  include ::profile_firewall
  include ::profile_monitoring
  include ::profile_motd
  include ::profile_pam_access
  include ::profile_puppet_agent
  include ::profile_sudo
  include ::profile_timezone
  include ::profile_system_auth
  include ::profile_virtual
  include ::sshd

}
