class profile::git_webhook (
  $force_zack_r10k_webhook = false
) {

  if versioncmp( $::pe_server_version, '2015.2.99' ) <= 0 or $force_zack_r10k_webhook {
    include profile::git_webhook::zack_r10k_webhook
  } else {
    include profile::git_webhook::code_manager
    include profile::git_webhook::zack_r10k_webhook_disable
  }

}
