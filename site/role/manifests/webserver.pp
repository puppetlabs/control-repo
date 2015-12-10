# This role would be made of all the profiles that need to be included to make
# a webserver work

class role::webserver {

  # All roles should include the base profile
  include profile::base

}
