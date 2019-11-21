# Base profile for linux nodes
class profile::base::linux {
  class { 'ntp':
    servers => [ '0.us.pool.ntp.org', '1.us.pool.ntp.org', '2.us.pool.ntp.org', '3.us.pool.ntp.org' ],
  }
}
