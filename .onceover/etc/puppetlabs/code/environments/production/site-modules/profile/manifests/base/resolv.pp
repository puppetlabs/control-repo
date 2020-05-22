# This class can be used to configure resolv.conf.
#
# @example when declaring the resolver class
#  class { '::profiles::base::resolv': }
#
class profile::base::resolv (
  Optional[String] $domainname = undef,
  Array[String] $nameservers = [],
  Optional[String] $searchpath = undef,
) {

  class { '::resolv_conf':
    domainname  => $domainname,
    nameservers => $nameservers,
    searchpath  => $searchpath,
  }
}
