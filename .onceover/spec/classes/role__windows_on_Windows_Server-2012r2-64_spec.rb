require 'spec_helper'

describe "role::windows" do

  context "using fact set Windows_Server-2012r2-64" do
    node_facts = {"agent_specified_environment"=>"production", "architecture"=>"x64", "dhcp_servers"=>{"Ethernet"=>"10.0.2.2", "system"=>"10.0.2.2"}, "dmi"=>{"manufacturer"=>"innotek GmbH", "product"=>{"name"=>"VirtualBox", "serial_number"=>"0"}}, "env_windows_installdir"=>"C:\\Program Files\\Puppet Labs\\Puppet", "facterversion"=>"3.1.1", "fqdn"=>"WIN-E5K8TM30719", "hardwareisa"=>"x64", "hardwaremodel"=>"x86_64", "hostname"=>"WIN-E5K8TM30719", "id"=>"WIN-E5K8TM30719\\vagrant", "identity"=>{"user"=>"WIN-E5K8TM30719\\vagrant"}, "interfaces"=>"Ethernet", "ipaddress"=>"10.0.2.15", "ipaddress6"=>"fe80::a180:36e0:3a6e:1005%12", "ipaddress6_Ethernet"=>"fe80::a180:36e0:3a6e:1005%12", "ipaddress_Ethernet"=>"10.0.2.15", "is_virtual"=>true, "kernel"=>"windows", "kernelmajversion"=>"6.3", "kernelrelease"=>"6.3.9600", "kernelversion"=>"6.3.9600", "macaddress"=>"08:00:27:81:38:FA", "macaddress_Ethernet"=>"08:00:27:81:38:FA", "manufacturer"=>"innotek GmbH", "memory"=>{"system"=>{"available"=>"1.42 GiB", "available_bytes"=>1521610752, "capacity"=>"29.13%", "total"=>"2.00 GiB", "total_bytes"=>2147012608, "used"=>"596.43 MiB", "used_bytes"=>625401856}}, "memoryfree"=>"1.42 GiB", "memoryfree_mb"=>1451.12109375, "memorysize"=>"2.00 GiB", "memorysize_mb"=>2047.55078125, "mtu_Ethernet"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "netmask6_Ethernet"=>"ffff:ffff:ffff:ffff::", "netmask_Ethernet"=>"255.255.255.0", "network"=>"10.0.2.0", "network6"=>"fe80::%12", "network6_Ethernet"=>"fe80::%12", "network_Ethernet"=>"10.0.2.0", "networking"=>{"dhcp"=>"10.0.2.2", "fqdn"=>"WIN-E5K8TM30719", "hostname"=>"WIN-E5K8TM30719", "interfaces"=>{"Ethernet"=>{"bindings"=>[{"address"=>"10.0.2.15", "netmask"=>"255.255.255.0", "network"=>"10.0.2.0"}], "bindings6"=>[{"address"=>"fe80::a180:36e0:3a6e:1005%12", "netmask"=>"ffff:ffff:ffff:ffff::", "network"=>"fe80::%12"}], "dhcp"=>"10.0.2.2", "ip"=>"10.0.2.15", "ip6"=>"fe80::a180:36e0:3a6e:1005%12", "mac"=>"08:00:27:81:38:FA", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::%12"}}, "ip"=>"10.0.2.15", "ip6"=>"fe80::a180:36e0:3a6e:1005%12", "mac"=>"08:00:27:81:38:FA", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::%12", "primary"=>"Ethernet"}, "operatingsystem"=>"windows", "operatingsystemmajrelease"=>"2012 R2", "operatingsystemrelease"=>"2012 R2", "os"=>{"architecture"=>"x64", "family"=>"windows", "hardware"=>"x86_64", "name"=>"windows", "release"=>{"full"=>"2012 R2", "major"=>"2012 R2"}, "windows"=>{"system32"=>"C:\\Windows\\system32"}}, "osfamily"=>"windows", "path"=>"C:/Program Files/Puppet Labs/Puppet/facter/bin;C:\\Program Files\\Puppet Labs\\Puppet\\puppet\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\facter\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\hiera\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\mcollective\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\sys\\ruby\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\sys\\tools\\bin;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Program Files (x86)\\Git\\cmd;C:\\Program Files (x86)\\Git\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\bin", "physicalprocessorcount"=>1, "processor0"=>"Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz", "processorcount"=>1, "processors"=>{"count"=>1, "isa"=>"x64", "models"=>["Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz"], "physicalcount"=>1}, "productname"=>"VirtualBox", "puppetversion"=>"4.2.3", "ruby"=>{"platform"=>"x64-mingw32", "sitedir"=>"C:/Program Files/Puppet Labs/Puppet/sys/ruby/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.7"}, "rubyplatform"=>"x64-mingw32", "rubysitedir"=>"C:/Program Files/Puppet Labs/Puppet/sys/ruby/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.7", "serialnumber"=>"0", "system32"=>"C:\\Windows\\system32", "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>287, "uptime"=>"0:04 hours"}, "timezone"=>"Coordinated Universal Time", "uptime"=>"0:04 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>287, "virtual"=>"virtualbox", "clientcert"=>"win-e5k8tm30719", "clientversion"=>"4.2.3", "clientnoop"=>false}
    let(:facts) { node_facts }


    before :each do
      # Curtrently there is some code within Puppet that will try to execute
      # commands when compiling a catalog even though it shouldn't. One example is
      # the groups attribute of the user resource on AIX. If we are running on
      # Windows but pretending to be UNIX this will definitely fail so we need to
      # mock it (or vice versa)
      # Details:
      # https://github.com/puppetlabs/puppet/blob/master/lib/puppet/util/execution.rb#L191
      expected_null_file = Puppet::Util::Platform.windows? ? 'NUL' : '/dev/null'
      unless File.exist? expected_null_file
        allow(Puppet::Util::Execution).to receive(:execute).and_raise(Puppet::ExecutionFailure.new("Onceover caused this"))
      end
    end

    let(:pre_condition) {
      pp = <<-'END'
$onceover_class = 'role::windows'
$onceover_node  = 'Windows_Server-2012r2-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

