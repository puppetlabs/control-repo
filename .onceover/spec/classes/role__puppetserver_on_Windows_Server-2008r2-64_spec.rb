require 'spec_helper'

describe "role::puppetserver" do

  context "using fact set Windows_Server-2008r2-64" do
    node_facts = {"agent_specified_environment"=>"production", "aio_agent_build"=>"1.2.2", "aio_agent_version"=>"1.2.2", "architecture"=>"x64", "common_appdata"=>"C:\\ProgramData", "concat_basedir"=>"C:/ProgramData/PuppetLabs/puppet/cache/concat", "custom_auth_conf"=>"false", "datacenter"=>"portland", "dhcp_servers"=>{"Local Area Connection"=>"10.0.2.2"}, "dmi"=>{"manufacturer"=>"innotek GmbH", "product"=>{"name"=>"VirtualBox", "serial_number"=>"0"}}, "domain"=>"pdx.puppetlabs.demo", "env_windows_installdir"=>"C:\\Program Files\\Puppet Labs\\Puppet", "facterversion"=>"3.0.2", "fqdn"=>"server2008r2a.pdx.puppetlabs.demo", "hardwareisa"=>"x64", "hardwaremodel"=>"x86_64", "hostname"=>"server2008r2a", "id"=>"SERVER2008R2A\\vagrant", "identity"=>{"user"=>"SERVER2008R2A\\vagrant"}, "iis_version"=>"Get-ItemProperty : Cannot find path 'HKLM:\\SOFTWARE\\Microsoft\\InetStp\\' because it does not exist.\nAt line:1 char:18\n+ (Get-ItemProperty <<<<  HKLM:\\SOFTWARE\\Microsoft\\InetStp\\ -Name VersionString).VersionString.SubString(8,3)\n    + CategoryInfo          : ObjectNotFound: (HKLM:\\SOFTWARE\\Microsoft\\InetStp\\:String) [Get-ItemProperty], ItemNotFo \n   undException\n    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.GetItemPropertyCommand\n \nYou cannot call a method on a null-valued expression.\nAt line:1 char:97\n+ (Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\InetStp\\ -Name VersionString).VersionString.SubString <<<< (8,3)\n    + CategoryInfo          : InvalidOperation: (SubString:String) [], RuntimeException\n    + FullyQualifiedErrorId : InvokeMethodOnNull\n \n", "interfaces"=>"Local Area Connection 2,Local Area Connection", "ipaddress"=>"10.20.1.101", "ipaddress6"=>"fe80::2c34:c353:1aaa:a872%13", "ipaddress6_Local Area Connection"=>"fe80::50f8:86eb:f103:75b%12", "ipaddress6_Local Area Connection 2"=>"fe80::2c34:c353:1aaa:a872%13", "ipaddress_Local Area Connection"=>"10.0.2.15", "ipaddress_Local Area Connection 2"=>"10.20.1.101", "is_admin"=>true, "is_pe"=>false, "is_virtual"=>true, "kernel"=>"windows", "kernelmajversion"=>"6.1", "kernelrelease"=>"6.1.7600", "kernelversion"=>"6.1.7600", "macaddress"=>"08:00:27:7B:C7:40", "macaddress_Local Area Connection"=>"08:00:27:AB:52:FB", "macaddress_Local Area Connection 2"=>"08:00:27:7B:C7:40", "manufacturer"=>"innotek GmbH", "memory"=>{"system"=>{"available"=>"448.14 MiB", "available_bytes"=>469909504, "capacity"=>"56.22%", "total"=>"1023.55 MiB", "total_bytes"=>1073274880, "used"=>"575.41 MiB", "used_bytes"=>603365376}}, "memoryfree"=>"448.14 MiB", "memoryfree_mb"=>448.140625, "memorysize"=>"1023.55 MiB", "memorysize_mb"=>1023.5546875, "mtu_Local Area Connection"=>1500, "mtu_Local Area Connection 2"=>1500, "mysql_server_id"=>8583088, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "netmask6_Local Area Connection"=>"ffff:ffff:ffff:ffff::", "netmask6_Local Area Connection 2"=>"ffff:ffff:ffff:ffff::", "netmask_Local Area Connection"=>"255.255.255.0", "netmask_Local Area Connection 2"=>"255.255.255.0", "network"=>"10.20.1.0", "network6"=>"fe80::%13", "network6_Local Area Connection"=>"fe80::%12", "network6_Local Area Connection 2"=>"fe80::%13", "network_Local Area Connection"=>"10.0.2.0", "network_Local Area Connection 2"=>"10.20.1.0", "networking"=>{"domain"=>"pdx.puppetlabs.demo", "fqdn"=>"server2008r2a.pdx.puppetlabs.demo", "hostname"=>"server2008r2a", "interfaces"=>{"Local Area Connection"=>{"dhcp"=>"10.0.2.2", "ip"=>"10.0.2.15", "ip6"=>"fe80::50f8:86eb:f103:75b%12", "mac"=>"08:00:27:AB:52:FB", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::%12"}, "Local Area Connection 2"=>{"ip"=>"10.20.1.101", "ip6"=>"fe80::2c34:c353:1aaa:a872%13", "mac"=>"08:00:27:7B:C7:40", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.20.1.0", "network6"=>"fe80::%13"}}, "ip"=>"10.20.1.101", "ip6"=>"fe80::2c34:c353:1aaa:a872%13", "mac"=>"08:00:27:7B:C7:40", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.20.1.0", "network6"=>"fe80::%13"}, "operatingsystem"=>"windows", "operatingsystemmajrelease"=>"2008 R2", "operatingsystemrelease"=>"2008 R2", "os"=>{"architecture"=>"x64", "family"=>"windows", "hardware"=>"x86_64", "name"=>"windows", "release"=>{"full"=>"2008 R2", "major"=>"2008 R2"}, "windows"=>{"system32"=>"C:\\Windows\\system32"}}, "osfamily"=>"windows", "path"=>"C:/Program Files/Puppet Labs/Puppet/facter/bin;C:\\Program Files\\Puppet Labs\\Puppet\\puppet\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\facter\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\hiera\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\mcollective\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\sys\\ruby\\bin;C:\\Program Files\\Puppet Labs\\Puppet\\sys\\tools\\bin;%SystemRoot%\\system32\\WindowsPowerShell\\v1.0\\;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\Program Files\\Puppet Labs\\Puppet\\bin;C:\\ProgramData\\chocolatey\\bin;", "pe_concat_basedir"=>"C:/ProgramData/PuppetLabs/puppet/cache/pe_concat", "physicalprocessorcount"=>1, "platform_symlink_writable"=>false, "processor0"=>"Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz", "processorcount"=>1, "processors"=>{"count"=>1, "isa"=>"x64", "models"=>["Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz"], "physicalcount"=>1}, "productname"=>"VirtualBox", "puppet_files_dir_present"=>false, "puppet_vardir"=>"C:/ProgramData/PuppetLabs/puppet/cache", "puppetversion"=>"4.2.1", "ruby"=>{"platform"=>"x64-mingw32", "sitedir"=>"C:/Program Files/Puppet Labs/Puppet/sys/ruby/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.6"}, "rubyplatform"=>"x64-mingw32", "rubysitedir"=>"C:/Program Files/Puppet Labs/Puppet/sys/ruby/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.6", "serialnumber"=>"0", "staging_http_get"=>"powershell", "staging_windir"=>"C:\\ProgramData\\staging", "system32"=>"C:\\Windows\\system32", "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>266, "uptime"=>"0:04 hours"}, "timezone"=>"Pacific Daylight Time", "uptime"=>"0:04 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>266, "virtual"=>"virtualbox", "clientcert"=>"server2008r2a.pdx.puppetlabs.demo", "clientversion"=>"4.2.1", "clientnoop"=>false}
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
$onceover_node  = 'Windows_Server-2008r2-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

