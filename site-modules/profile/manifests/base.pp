# Include basic profile classes
class profile::base {

  include ::profile_additional_packages
  include ::profile_additional_yumrepos
#  include ::profile_email
#  include ::profile_pam_access
#  include ::profile_sudo
#  include ::profile_timezone
#  include ::sshd
#  include ::tcpwrappers

}
