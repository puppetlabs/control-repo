module Puppet::Parser::Functions
  newfunction(:puppet_master_classifer_settings, :type => :rvalue) do |args|
    function_parseyaml([function_file([File.join(lookupvar('settings::confdir').to_s, 'classifier.yaml')])])
  end
end
