class role::all_in_one_pe {

  $webhook_username = hiera('webhook_username', fqdn_rand_string(10, '', 'username'))
  $webhook_password = hiera('webhook_password', fqdn_rand_string(20, '', 'password'))

  include profile::base

  class { 'profile::puppetmaster' :
    webhook_username => $webhook_username,
    webhook_password => $webhook_password,
  }

  class { 'profile::zack_r10k_webhook' :
    username => $webhook_username,
    password => $webhook_password,
  }

}
