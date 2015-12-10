# This role would be made of all the profiles that need to be included to make
# a database server work.

class role::database_server {

  # All roles should include the base profile
  include profile::base

}
