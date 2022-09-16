# This role would be made of all the profiles that need to be included to make a database server work
# All roles should include the base profile
class role::database_server {

  include profile::base

}
