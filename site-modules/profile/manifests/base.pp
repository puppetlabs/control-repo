class profile::base {
  include profile::test
  notify {'This is from profile::base': }
}
