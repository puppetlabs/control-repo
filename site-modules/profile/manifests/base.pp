class profile::base {
#  require profile::goldload::config
  contain profile::winlogbeat
  notify {'This is from profile::base': }
}
