class profile::gitlab {

  class { 'gitlab':
    external_url => hiera( 'gms_server_url', "https://${::fqdn}") ,
  }

}
