class role::all_in_one_pe {

  include profile::puppetmaster
  include profile::git_webhook

}
