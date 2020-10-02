class profile::dns::client {
  $dir_ip = lookup( 'Address', undef, undef, '1.1.1.1' )
  case $facts['os']['name'] {
    'windows': {
      dsc_dnsserveraddress { $dir_ip:
        dsc_address => $dir_ip,
        dsc_interfacealias => $facts['networking']['primary'],
        dsc_addressfamily => 'IPv4',
        dsc_validate => true,
      }
      dsc_dnsclientglobalsetting { 'domainname':
        dsc_issingleinstance => yes,
        dsc_suffixsearchlist => 'node.consul',
      }
    }
    /^(Debian|Ubuntu)$/: {
      class { 'netplan':
        config_file => '/etc/netplan/50-cloud-init.yaml',
        ethernets => {
          'ens3' => {
            'dhcp4' => true,
            'nameservers' => {
              'search' => ['node.consul'],
              'addresses' => [ "$dir_ip" ],
            }
          }
        },
        netplan_apply => true,
      }
    }
    default: { notify { 'Which OS? What?': } }
  }
}
