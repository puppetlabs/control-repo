class profile::base {
  contain profile::test
  notify {'This is from profile::base': }
}
