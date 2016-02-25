class role::all_in_one_pe {

  include profile::puppetmaster
  include pe_code_manager_webhook

}
