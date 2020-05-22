require 'spec_helper'

describe "role::puppetserver" do

  context "using fact set windows-10-64" do
    node_facts = {"puppetversion"=>"6.0.2", "puppet_inventory_metadata"=>{"packages"=>{"collection_enabled"=>false, "last_collection_time"=>"0.0s"}}, "package_provider"=>"windows", "pe_concat_basedir"=>"C:/ProgramData/PuppetLabs/puppet/cache/pe_concat", "is_pe"=>false, "platform_symlink_writable"=>false, "puppet_files_dir_present"=>false, "puppet_vardir"=>"C:/ProgramData/PuppetLabs/puppet/cache", "puppet_environmentpath"=>"C:/ProgramData/PuppetLabs/code/environments", "puppet_server"=>"pe-puppet.localdomain", "service_provider"=>"windows", "staging_http_get"=>"curl", "common_appdata"=>"C:\\ProgramData", "architecture"=>"x64", "kernel"=>"windows", "virtual"=>"vmware", "is_virtual"=>true, "hardwaremodel"=>"x64", "operatingsystem"=>"windows", "os"=>{"name"=>"windows", "family"=>"windows", "release"=>{"major"=>"10", "full"=>"10"}}, "facterversion"=>"2.5.1", "fqdn"=>"VAGRANT-HB9G3RD", "hostname"=>"VAGRANT-HB9G3RD", "id"=>"vagrant-hb9g3rd\\vagrant", "interfaces"=>"Ethernet0_2", "ipaddress_ethernet0_2"=>"192.168.43.174", "ipaddress6_ethernet0_2"=>"fd72:b3ab:b8dd:0:f563:fac2:928c:6aa", "macaddress_ethernet0_2"=>"00:0C:29:A3:53:54", "netmask_ethernet0_2"=>"255.255.255.0", "mtu_ethernet0_2"=>0, "ipaddress"=>"192.168.43.174", "ipaddress6"=>"fd72:b3ab:b8dd:0:f563:fac2:928c:6aa", "kernelmajversion"=>"10.0", "kernelrelease"=>"10.0.17134", "kernelversion"=>"10.0.17134", "macaddress"=>"00:0C:29:A3:53:54", "manufacturer"=>"Phoenix Technologies LTD", "serialnumber"=>"VMware-56 4d 36 2e 2e a4 81 f9-0d 05 ae d0 e5 a3 53 54", "productname"=>"VMware Virtual Platform", "memorysize"=>"4.00 GB", "memoryfree"=>"2.30 GB", "memorysize_mb"=>"4095.49", "memoryfree_mb"=>"2360.00", "netmask"=>"255.255.255.0", "network_ethernet0_2"=>"192.168.43.0", "operatingsystemmajrelease"=>"10", "operatingsystemrelease"=>"10", "osfamily"=>"windows", "path"=>"C:\\tools\\ruby24\\bin;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Windows\\System32\\OpenSSH\\;C:\\ProgramData\\chocolatey\\bin;C:\\Program Files (x86)\\vim\\vim80;C:\\Program Files\\Git\\cmd;C:\\Program Files\\Puppet Labs\\Puppet\\bin;C:\\Users\\vagrant\\AppData\\Local\\Microsoft\\WindowsApps;", "physicalprocessorcount"=>4, "processors"=>{"models"=>["Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz"], "count"=>4, "physicalcount"=>4}, "processor0"=>"Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "processor1"=>"Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "processor2"=>"Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "processor3"=>"Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "processorcount"=>4, "ps"=>"tasklist.exe", "rubyplatform"=>"x64-mingw32", "rubysitedir"=>"C:/tools/ruby24/lib/ruby/site_ruby/2.4.0", "rubyversion"=>"2.4.3", "system32"=>"C:\\Windows\\system32", "system_uptime"=>{"seconds"=>1113359, "hours"=>309, "days"=>12, "uptime"=>"12 days"}, "timezone"=>"GMT Standard Time", "uptime"=>"12 days", "uptime_days"=>12, "uptime_hours"=>309, "uptime_seconds"=>1113359, "clientcert"=>"vagrant-hb9g3rd.lan.asio", "clientversion"=>"6.0.2", "clientnoop"=>false}
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
$onceover_class = 'role::puppetserver'
$onceover_node  = 'windows-10-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

