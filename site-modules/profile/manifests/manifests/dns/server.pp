class profile::dns::server {
  include dns::server
  # Forwarders
  dns::server::options { '/etc/bind/named.conf.options':
    dnssec_enable => false,
    dnssec_validation => no,
    forwarders => [ '129.241.0.201' ],
  }
  dns::zone { 'consul':
    zone_type => forward,
    forward_policy => only,
    allow_forwarder => [ '127.0.0.1 port 8600' ],
  }
}
