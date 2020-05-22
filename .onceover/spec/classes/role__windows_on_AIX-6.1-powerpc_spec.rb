require 'spec_helper'

describe "role::windows" do

  context "using fact set AIX-6.1-powerpc" do
    node_facts = {"aio_agent_version"=>"1.8.2", "architecture"=>"PowerPC_POWER7", "augeas"=>{"version"=>"1.4.0"}, "augeasversion"=>"1.4.0", "domain"=>"delivery.puppetlabs.net", "facterversion"=>"3.5.0", "fqdn"=>"pe-aix-61-se.delivery.puppetlabs.net", "gid"=>"system", "hardwareisa"=>"powerpc", "hardwaremodel"=>"IBM,8231-E1D", "hostname"=>"pe-aix-61-se", "id"=>"root", "identity"=>{"gid"=>0, "group"=>"system", "privileged"=>true, "uid"=>0, "user"=>"root"}, "interfaces"=>"lo0,en0", "ipaddress"=>"10.32.77.35", "ipaddress6_lo0"=>"::1", "ipaddress_en0"=>"10.32.77.35", "ipaddress_lo0"=>"127.0.0.1", "kernel"=>"AIX", "kernelmajversion"=>"6100", "kernelrelease"=>"6100-07-04-1216", "kernelversion"=>"6100", "macaddress"=>"66:a4:d9:f8:4a:04", "macaddress_en0"=>"66:a4:d9:f8:4a:04", "memory"=>{"swap"=>{"available"=>"410.43 MiB", "available_bytes"=>430366720, "capacity"=>"19.84%", "total"=>"512.00 MiB", "total_bytes"=>536870912, "used"=>"101.57 MiB", "used_bytes"=>106504192}, "system"=>{"available"=>"10.88 MiB", "available_bytes"=>11403264, "capacity"=>"98.94%", "total"=>"1.00 GiB", "total_bytes"=>1073741824, "used"=>"1013.13 MiB", "used_bytes"=>1062338560}}, "memoryfree"=>"10.88 MiB", "memoryfree_mb"=>10.875, "memorysize"=>"1.00 GiB", "memorysize_mb"=>1024.0, "mtu_en0"=>1500, "mtu_lo0"=>16896, "netmask"=>"255.255.255.0", "netmask6_lo0"=>"::", "netmask_en0"=>"255.255.255.0", "netmask_lo0"=>"255.0.0.0", "network"=>"10.32.77.0", "network6_lo0"=>"::", "network_en0"=>"10.32.77.0", "network_lo0"=>"127.0.0.0", "networking"=>{"domain"=>"delivery.puppetlabs.net", "fqdn"=>"pe-aix-61-se.delivery.puppetlabs.net", "hostname"=>"pe-aix-61-se", "interfaces"=>{"en0"=>{"bindings"=>[{"address"=>"10.32.77.35", "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}], "ip"=>"10.32.77.35", "mac"=>"66:a4:d9:f8:4a:04", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}, "lo0"=>{"bindings"=>[{"address"=>"127.0.0.1", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}], "bindings6"=>[{"address"=>"::1", "netmask"=>"::", "network"=>"::"}], "ip"=>"127.0.0.1", "ip6"=>"::1", "mtu"=>16896, "netmask"=>"255.0.0.0", "netmask6"=>"::", "network"=>"127.0.0.0", "network6"=>"::"}}, "ip"=>"10.32.77.35", "mac"=>"66:a4:d9:f8:4a:04", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0", "primary"=>"en0"}, "operatingsystem"=>"AIX", "operatingsystemmajrelease"=>"6100", "operatingsystemrelease"=>"6100-07-04-1216", "os"=>{"architecture"=>"PowerPC_POWER7", "family"=>"AIX", "hardware"=>"IBM,8231-E1D", "name"=>"AIX", "release"=>{"full"=>"6100-07-04-1216", "major"=>"6100"}}, "osfamily"=>"AIX", "path"=>"::/usr/bin:/etc:/usr/sbin:/sbin", "processor0"=>"PowerPC_POWER7", "processor1"=>"PowerPC_POWER7", "processor2"=>"PowerPC_POWER7", "processor3"=>"PowerPC_POWER7", "processor4"=>"PowerPC_POWER7", "processor5"=>"PowerPC_POWER7", "processor6"=>"PowerPC_POWER7", "processor7"=>"PowerPC_POWER7", "processorcount"=>8, "processors"=>{"count"=>8, "isa"=>"powerpc", "models"=>["PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7"], "speed"=>"4.23 GHz"}, "puppetversion"=>"4.8.1", "ruby"=>{"platform"=>"powerpc-aix6.1.0.0", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.9"}, "rubyplatform"=>"powerpc-aix6.1.0.0", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.9", "serialnumber"=>"21280CV", "ssh"=>{"dsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 2 1 571109ba578ea17c854dcefad0e667bbbe4232c2", "sha256"=>"SSHFP 2 2 acd6ea2ff8cc0a0a8be88e6dada2688a17b7adb2a52312745208696f99dce945"}, "key"=>"AAAAB3NzaC1kc3MAAACBAPJEJEzFa4YmVyS17c4Cs8ZWFJIg+igYRWiG/oJ4KMAu9R+cq3TuokGp0h5/T69yNeOn32h1WPYPIjnr14FyOr5Bb6+h+ej3WKnS1IpAGSy2H8Z21r4Cz0qX+madm/dGrtN1TI+6OV1xXXICZB0F0Lg4xilzix431nGunqbm1XXLAAAAFQDjxidL5XtudVMcTUzGFQ33cVwdTwAAAIBUjvKhMQP1304lW+Fr7A35ypaQrCVbsJFQD4egb9fGKY5WKIlQo7UGS/jvDtPS7iRDaLdiC2K5D4MYM9EUHgkprIO1d/o0i2UsYgec8WCJSBja/I4n0slEl7XEwM3SmnYNT0xfZM01Caj9+AyJFtRoF7l00QjSoxyOGMlEfvbCDAAAAIEA8MTmNjwDneigJnnxK9ZL4cvW4zQ+PQDglCdjJ2sB/IcpSvVyu6R9jbHSnfKhergRmmNJzKNA1Oc/INvNr4i9FFAuXEKkafmUyMavgd19uMxdpTAcvOJxwhG8TCrLQtJbm8Rn1e5wFM+4wnpc2y7HsBYGonmK9O5p9Fd3qkUx4BY="}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 2faed3b06ba31bcbf069dcdb759d36730a2c649d", "sha256"=>"SSHFP 1 2 51fbfd79200a8667eeb1a8a4eee2487bbdee663189a9ca86a07069f5d95f9826"}, "key"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDP+DHJRMbR8a4WvTwUGnz9rq+hHDVcP26xG+WIvIC5vlBk/N2lcrD7qs45Ht1kpZo4k4td+PQmi2k6I3BSVEeR9FTwbHEtjv8op1F7VTPXSSdY+90/CiQ4MA5s7d2Lbm5jipMV6dCneYZWsEkHKHzcp/Qst3w+0JSAHpx1wEOAlk/uJuLHHvAFYPZtdwzxTOW8/di5CpBIz/Pl1gcO8vQrFygvkFdYKPL44/zS3MZbmi7Hi6Q0PdcarFlWn6IodAlVSrJ/hcBbMkXJWV2L3zCt5nX4tJkYoOU9IIjGQEh+1cmIcWGdXpyvyaUnbSXJsFP9yAzi+MszYLJq9mUKIYch"}}, "sshdsakey"=>"AAAAB3NzaC1kc3MAAACBAPJEJEzFa4YmVyS17c4Cs8ZWFJIg+igYRWiG/oJ4KMAu9R+cq3TuokGp0h5/T69yNeOn32h1WPYPIjnr14FyOr5Bb6+h+ej3WKnS1IpAGSy2H8Z21r4Cz0qX+madm/dGrtN1TI+6OV1xXXICZB0F0Lg4xilzix431nGunqbm1XXLAAAAFQDjxidL5XtudVMcTUzGFQ33cVwdTwAAAIBUjvKhMQP1304lW+Fr7A35ypaQrCVbsJFQD4egb9fGKY5WKIlQo7UGS/jvDtPS7iRDaLdiC2K5D4MYM9EUHgkprIO1d/o0i2UsYgec8WCJSBja/I4n0slEl7XEwM3SmnYNT0xfZM01Caj9+AyJFtRoF7l00QjSoxyOGMlEfvbCDAAAAIEA8MTmNjwDneigJnnxK9ZL4cvW4zQ+PQDglCdjJ2sB/IcpSvVyu6R9jbHSnfKhergRmmNJzKNA1Oc/INvNr4i9FFAuXEKkafmUyMavgd19uMxdpTAcvOJxwhG8TCrLQtJbm8Rn1e5wFM+4wnpc2y7HsBYGonmK9O5p9Fd3qkUx4BY=", "sshfp_dsa"=>"SSHFP 2 1 571109ba578ea17c854dcefad0e667bbbe4232c2\nSSHFP 2 2 acd6ea2ff8cc0a0a8be88e6dada2688a17b7adb2a52312745208696f99dce945", "sshfp_rsa"=>"SSHFP 1 1 2faed3b06ba31bcbf069dcdb759d36730a2c649d\nSSHFP 1 2 51fbfd79200a8667eeb1a8a4eee2487bbdee663189a9ca86a07069f5d95f9826", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDP+DHJRMbR8a4WvTwUGnz9rq+hHDVcP26xG+WIvIC5vlBk/N2lcrD7qs45Ht1kpZo4k4td+PQmi2k6I3BSVEeR9FTwbHEtjv8op1F7VTPXSSdY+90/CiQ4MA5s7d2Lbm5jipMV6dCneYZWsEkHKHzcp/Qst3w+0JSAHpx1wEOAlk/uJuLHHvAFYPZtdwzxTOW8/di5CpBIz/Pl1gcO8vQrFygvkFdYKPL44/zS3MZbmi7Hi6Q0PdcarFlWn6IodAlVSrJ/hcBbMkXJWV2L3zCt5nX4tJkYoOU9IIjGQEh+1cmIcWGdXpyvyaUnbSXJsFP9yAzi+MszYLJq9mUKIYch", "swapfree"=>"410.43 MiB", "swapfree_mb"=>410.4296875, "swapsize"=>"512.00 MiB", "swapsize_mb"=>512.0, "system_uptime"=>{"days"=>418, "hours"=>10035, "seconds"=>36127200, "uptime"=>"418 days"}, "timezone"=>"PST", "uptime"=>"418 days", "uptime_days"=>418, "uptime_hours"=>10035, "uptime_seconds"=>36127200, "clientcert"=>"pe-aix-61-se.delivery.puppetlabs.net", "clientversion"=>"4.8.1", "clientnoop"=>false}
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
$onceover_node  = 'AIX-6.1-powerpc'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

