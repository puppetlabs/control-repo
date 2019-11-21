class role::goldload_server{
  contain profile::base
#  include profile::base::ciphers
  contain profile::goldload::config
  Class['profile::goldload::config'] -> Class['profile::base']
}
