# profile::firewall::app_rules
class profile::firewall::app_rules {

  # Custom Application Firewall rules found in Hiera

  ['inbound','outbound'].each | $direction | {
    $firewalls= lookup("profile::firewall::${direction}", Data, 'deep', {})
    $firewalls.each | $name, $rule | {
      $label = upcase( $direction )
      $chain = $direction ? {
        'inbound'  => 'INPUT',
        'outbound' => 'OUTPUT',
        default    => '',
      }
      if has_key( $rule, 'jump') {
         $default = {}
      } else {
         $default = { action => 'accept' }
      }
      if $rule['destination'] {
        if is_array( $rule['destination'] ){
          $destinations = $rule['destination']
        } else {
          $destinations = [ $rule['destination'] ]
        }
        $destinations.each | $dest | {
          $mod_rule = $rule + { 'destination' => $dest }
          create_resources( firewall, { "${name} ${label} ${dest}" => $mod_rule }, $default + { proto   => 'tcp', chain => $chain } )
        }
      }
      else {
        create_resources( firewall, { "${name} ${label}" => $rule }, $default + { proto   => 'tcp', chain => $chain } )
      }
    }
  }

}
