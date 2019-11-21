class profile::base {
  require profile::goldload::config
  include profile::test
  notify {'This is from profile::base': }
}
