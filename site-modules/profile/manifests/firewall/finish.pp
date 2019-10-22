# == Class: profile::firewall::finish
#
# Post actions for firewall management.
#
class profile::firewall::finish {


  ['INPUT','OUTPUT'].each | $chain | {

    # Drop the known noise from hitting the log
    # ['255.255.255.255',ip_address(ip_broadcast("${::network}/${::netmask}"))].each | $dest | {
    #   firewall { "990 Broadcasts for $dest for ${chain}":
    #     destination  => $dest,
    #     proto  => 'all',
    #     action => 'drop',
    #     chain  => $chain,
    #   }
    # } 

    # Log whatever hasn't been dealt with already
    firewall { "998 Logging for ${chain}":
      jump   => 'LOG',
      proto  => 'all',
      chain  => $chain,
    }

    # Drop everything else
    firewall { "999 drop all for ${chain}":
      proto  => 'all',
      action => 'drop',
      chain  => $chain,
    }
    firewall { "999 drop all for ${chain} for IPv6":
      proto    => 'all',
      action   => 'drop',
      chain    => $chain,
      provider => 'ip6tables',
    }
  }

}
