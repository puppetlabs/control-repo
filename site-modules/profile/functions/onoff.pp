# You can write simple custom functions in the Puppet language, to transform data and construct values.
#
# Convert a boolean value to a string of "On" or "Off".
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/lang_write_functions_in_puppet.htm
function profile::onoff(
  Variant[String, Boolean, Undef] $arg
) >> String {
  case $arg {
    false, undef, /\A(?i:false)\z/ : { 'Off' }
    true, /\A(?i:true)\z/          : { 'On' }
    default                    : { $arg }
  }
}
