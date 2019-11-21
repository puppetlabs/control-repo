# Role for puppet master
class role::master {
  include profile::base::linux
  include profile::puppet::master
}
