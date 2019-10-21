# == Class: profile::firewall::start
#
# Pre actions for firewall management.
#
class profile::firewall::start {

  class { 'firewall': }

  # Purge any unmanaged firewall rules
  resources { 'firewall':
    purge => true,
  }
  #resources { 'firewallchain':
  #purge => true,
  #}

  #Set up the chains (if specified)
  $chains = lookup('profile::firewall::chains', Data , 'deep', {})
  create_resources( firewallchain, $chains, { policy => 'drop', before => undef, ensure => 'present' } )
  

  # Default pre rules
  ['INPUT','OUTPUT'].each | $chain | {
    firewall { "000 accept all icmp ${chain}":
      proto  => 'icmp',
      action => 'accept',
      chain  => $chain,
    }
    if( $chain == 'INPUT' ){
      firewall { "001 accept all to lo interface ${chain}":
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
        chain  => $chain,
      }
      firewall { "002 reject local traffic not on loopback interface ${chain}":
        iniface     => '! lo',
        proto       => 'all',
        destination => '127.0.0.1/8',
        action      => 'reject',
        chain  => $chain,
      }
    }
    if( $chain == 'OUTPUT' ){
      firewall { "001 accept all localhost sourced ${chain}":
        proto   => 'all',
        source  => '127.0.0.1/8',
        action  => 'accept',
        chain   => $chain,
      }
    }
    firewall { "003 accept related established rules ${chain}":
      proto  => 'all',
      state  => ['RELATED', 'ESTABLISHED'],
      action => 'accept',
      chain  => $chain,
    }
  }

}
