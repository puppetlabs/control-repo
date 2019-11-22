class profile::base {
#  require profile::goldload::config
  include profile::winlogbeat
  notify {'This is from profile::base': }
}
