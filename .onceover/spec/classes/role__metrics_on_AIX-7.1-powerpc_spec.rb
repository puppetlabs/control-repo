require 'spec_helper'

describe "role::metrics" do

  context "using fact set AIX-7.1-powerpc" do
    node_facts = {"aio_agent_version"=>"1.5.2", "architecture"=>"PowerPC_POWER7", "augeas"=>{"version"=>"1.4.0"}, "augeasversion"=>"1.4.0", "domain"=>"delivery.puppetlabs.net", "facterversion"=>"3.2.0", "fqdn"=>"pe-aix-71-se.delivery.puppetlabs.net", "gid"=>"system", "hardwareisa"=>"powerpc", "hardwaremodel"=>"IBM,8231-E1D", "hostname"=>"pe-aix-71-se", "id"=>"root", "identity"=>{"gid"=>0, "group"=>"system", "uid"=>0, "user"=>"root"}, "interfaces"=>"lo0,en0", "ipaddress"=>"10.32.77.36", "ipaddress6_lo0"=>"::1", "ipaddress_en0"=>"10.32.77.36", "ipaddress_lo0"=>"127.0.0.1", "is_pe"=>false, "kernel"=>"AIX", "kernelmajversion"=>"7100", "kernelrelease"=>"7100-01-05-1228", "kernelversion"=>"7100", "macaddress"=>"66:a4:dc:28:bf:04", "macaddress_en0"=>"66:a4:dc:28:bf:04", "memory"=>{"swap"=>{"available"=>"1007.14 MiB", "available_bytes"=>1056063488, "capacity"=>"1.65%", "total"=>"1.00 GiB", "total_bytes"=>1073741824, "used"=>"16.86 MiB", "used_bytes"=>17678336}, "system"=>{"available"=>"16.84 MiB", "available_bytes"=>17653760, "capacity"=>"98.36%", "total"=>"1.00 GiB", "total_bytes"=>1073741824, "used"=>"1007.16 MiB", "used_bytes"=>1056088064}}, "memoryfree"=>"16.84 MiB", "memoryfree_mb"=>16.8359375, "memorysize"=>"1.00 GiB", "memorysize_mb"=>1024.0, "mtu_en0"=>1500, "mtu_lo0"=>16896, "netmask"=>"255.255.255.0", "netmask6_lo0"=>"::", "netmask_en0"=>"255.255.255.0", "netmask_lo0"=>"255.0.0.0", "network"=>"10.32.77.0", "network6_lo0"=>"::", "network_en0"=>"10.32.77.0", "network_lo0"=>"127.0.0.0", "networking"=>{"domain"=>"delivery.puppetlabs.net", "fqdn"=>"pe-aix-71-se.delivery.puppetlabs.net", "hostname"=>"pe-aix-71-se", "interfaces"=>{"en0"=>{"bindings"=>[{"address"=>"10.32.77.36", "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}], "ip"=>"10.32.77.36", "mac"=>"66:a4:dc:28:bf:04", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}, "lo0"=>{"bindings"=>[{"address"=>"127.0.0.1", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}], "bindings6"=>[{"address"=>"::1", "netmask"=>"::", "network"=>"::"}], "ip"=>"127.0.0.1", "ip6"=>"::1", "mtu"=>16896, "netmask"=>"255.0.0.0", "netmask6"=>"::", "network"=>"127.0.0.0", "network6"=>"::"}}, "ip"=>"10.32.77.36", "mac"=>"66:a4:dc:28:bf:04", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0", "primary"=>"en0"}, "operatingsystem"=>"AIX", "operatingsystemmajrelease"=>"7100", "operatingsystemrelease"=>"7100-01-05-1228", "os"=>{"architecture"=>"PowerPC_POWER7", "family"=>"AIX", "hardware"=>"IBM,8231-E1D", "name"=>"AIX", "release"=>{"full"=>"7100-01-05-1228", "major"=>"7100"}}, "osfamily"=>"AIX", "package_provider"=>"aix", "path"=>"::/usr/bin:/etc:/usr/sbin:/sbin", "processor0"=>"PowerPC_POWER7", "processor1"=>"PowerPC_POWER7", "processor2"=>"PowerPC_POWER7", "processor3"=>"PowerPC_POWER7", "processor4"=>"PowerPC_POWER7", "processor5"=>"PowerPC_POWER7", "processor6"=>"PowerPC_POWER7", "processor7"=>"PowerPC_POWER7", "processorcount"=>8, "processors"=>{"count"=>8, "isa"=>"powerpc", "models"=>["PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7", "PowerPC_POWER7"], "speed"=>"4.23 GHz"}, "puppet_environmentpath"=>"/etc/puppetlabs/code/environments", "puppet_vardir"=>"/opt/puppetlabs/puppet/cache", "puppetversion"=>"4.5.2", "root_home"=>"/root", "ruby"=>{"platform"=>"powerpc-aix7.1.0.0", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.9"}, "rubyplatform"=>"powerpc-aix7.1.0.0", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.9", "serialnumber"=>"21280CV", "service_provider"=>"src", "ssh"=>{"dsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 2 1 1bbfbd9caff8924d4584cbb2a748f1be2690d04c", "sha256"=>"SSHFP 2 2 73ec4c25ea880adfbb7f66c60e92fec0ff130c4988765b5799e4707a7cdde68a"}, "key"=>"AAAAB3NzaC1kc3MAAACBAI5I6MVkSh3bO0WVTWIxbB0VyoFrpIXjAtBBveHKQDiB5I9OmCGkzytyR7ERBG/yqFS04hcEX8JV//3DoJeLJ0vupRCDLr4HoTYDGS3Dkvb3wqLn8aaaadz4Ca8IgRbx0vr8ANQbu/XT0/eTv5fRs3YWeijPe4Zgto2x55Ap7UDlAAAAFQDtb/7QYsDVPUt0dVWhOehzBNvybwAAAIBTxxfl95ZRcFG7b2cWljphohnZGzZCJortjE76JBIhnXRlVnlXQFT98hrjkPwedjsj9KWM0RpiKOdas3QAM6iTWLoAv/4GcvAWDa7TuJ5fs3eeQO0yCsTzRzpPwkOv6dcHK6OWWLiGybf/kPxIb546COFONVekdyIdksfZzwJ41QAAAIEAgj+4V9gdRBZcOX7XchaNUPaezTc3pNG1HG8iYTiCTV28EkpkQgzMtW7pPU1Nzqv5CX0LnFS+QN4lTWtuqtADYWSu3soz+7GuL8u3vximAAp6RcmWYSRpIdIQkHGvcyAzT5LlNRhGc/bBPM6RNoCkPzjEDHJDOgTdPx+tRNWXb8Y="}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 8957e5a6df12f351fd768ee9615b3906861ff4e5", "sha256"=>"SSHFP 1 2 5a2dddf4df75bc8f4f352d30a8192824e01386b4720708d249edec6f05c5eb81"}, "key"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQC38I+hMQxC/++t3XvgXPtpVglDV2Qp5Xqqp/ZmdJrW7gh3ylKWlOrJOlx72p9Qa2fTAU+eJpYeI8vAAKxtBqqoxVNfn9rGt8wR3eubcwm6CRLTCOqf2OoDJzyJw3RcgidhHuT2KPVYtNOpNEkFyTjtpru3RWrO08PLpT0simATc5XJrvSH9ODQCqzVi5Fhe58Kn1kyAmH9gr0vz/9zrhllBjxVhc3YFz2TKqnZD+zIYlYhoI1vm5zQSzUWA+8B9XBEGs3TUaSDKPANEwof2lt+auTHySlGRXTPL4D9mYw2BhrxRBESgLsbba23SVCMGPILDvb4JwI4vYc7E6AvrFIB"}}, "sshdsakey"=>"AAAAB3NzaC1kc3MAAACBAI5I6MVkSh3bO0WVTWIxbB0VyoFrpIXjAtBBveHKQDiB5I9OmCGkzytyR7ERBG/yqFS04hcEX8JV//3DoJeLJ0vupRCDLr4HoTYDGS3Dkvb3wqLn8aaaadz4Ca8IgRbx0vr8ANQbu/XT0/eTv5fRs3YWeijPe4Zgto2x55Ap7UDlAAAAFQDtb/7QYsDVPUt0dVWhOehzBNvybwAAAIBTxxfl95ZRcFG7b2cWljphohnZGzZCJortjE76JBIhnXRlVnlXQFT98hrjkPwedjsj9KWM0RpiKOdas3QAM6iTWLoAv/4GcvAWDa7TuJ5fs3eeQO0yCsTzRzpPwkOv6dcHK6OWWLiGybf/kPxIb546COFONVekdyIdksfZzwJ41QAAAIEAgj+4V9gdRBZcOX7XchaNUPaezTc3pNG1HG8iYTiCTV28EkpkQgzMtW7pPU1Nzqv5CX0LnFS+QN4lTWtuqtADYWSu3soz+7GuL8u3vximAAp6RcmWYSRpIdIQkHGvcyAzT5LlNRhGc/bBPM6RNoCkPzjEDHJDOgTdPx+tRNWXb8Y=", "sshfp_dsa"=>"SSHFP 2 1 1bbfbd9caff8924d4584cbb2a748f1be2690d04c\nSSHFP 2 2 73ec4c25ea880adfbb7f66c60e92fec0ff130c4988765b5799e4707a7cdde68a", "sshfp_rsa"=>"SSHFP 1 1 8957e5a6df12f351fd768ee9615b3906861ff4e5\nSSHFP 1 2 5a2dddf4df75bc8f4f352d30a8192824e01386b4720708d249edec6f05c5eb81", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQC38I+hMQxC/++t3XvgXPtpVglDV2Qp5Xqqp/ZmdJrW7gh3ylKWlOrJOlx72p9Qa2fTAU+eJpYeI8vAAKxtBqqoxVNfn9rGt8wR3eubcwm6CRLTCOqf2OoDJzyJw3RcgidhHuT2KPVYtNOpNEkFyTjtpru3RWrO08PLpT0simATc5XJrvSH9ODQCqzVi5Fhe58Kn1kyAmH9gr0vz/9zrhllBjxVhc3YFz2TKqnZD+zIYlYhoI1vm5zQSzUWA+8B9XBEGs3TUaSDKPANEwof2lt+auTHySlGRXTPL4D9mYw2BhrxRBESgLsbba23SVCMGPILDvb4JwI4vYc7E6AvrFIB", "swapfree"=>"1007.14 MiB", "swapfree_mb"=>1007.140625, "swapsize"=>"1.00 GiB", "swapsize_mb"=>1024.0, "system_uptime"=>{"days"=>160, "hours"=>3847, "seconds"=>13852500, "uptime"=>"160 days"}, "timezone"=>"PST", "uptime"=>"160 days", "uptime_days"=>160, "uptime_hours"=>3847, "uptime_seconds"=>13852500, "clientcert"=>"pe-aix-71-se.delivery.puppetlabs.net", "clientversion"=>"4.5.2", "clientnoop"=>false}
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
$onceover_class = 'role::metrics'
$onceover_node  = 'AIX-7.1-powerpc'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

