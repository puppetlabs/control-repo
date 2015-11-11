class role::all_in_one_pe {

  include profile::puppetmaster
  include profile::zack_r10k_webhook
  include profile::code_manager

}
