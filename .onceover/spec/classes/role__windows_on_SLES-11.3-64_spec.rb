require 'spec_helper'

describe "role::windows" do

  context "using fact set SLES-11.3-64" do
    node_facts = {"aio_agent_version"=>"1.8.3", "architecture"=>"x86_64", "augeas"=>{"version"=>"1.4.0"}, "augeasversion"=>"1.4.0", "bios_release_date"=>"12/01/2006", "bios_vendor"=>"innotek GmbH", "bios_version"=>"VirtualBox", "blockdevice_sda_model"=>"HARDDISK", "blockdevice_sda_size"=>53687091200, "blockdevice_sda_vendor"=>"VBOX", "blockdevices"=>"sda", "boardmanufacturer"=>"Oracle Corporation", "boardproductname"=>"VirtualBox", "boardserialnumber"=>"0", "chassistype"=>"Other", "disks"=>{"sda"=>{"model"=>"HARDDISK", "size"=>"50.00 GiB", "size_bytes"=>53687091200, "vendor"=>"VBOX"}}, "dmi"=>{"bios"=>{"release_date"=>"12/01/2006", "vendor"=>"innotek GmbH", "version"=>"VirtualBox"}, "board"=>{"manufacturer"=>"Oracle Corporation", "product"=>"VirtualBox", "serial_number"=>"0"}, "chassis"=>{"type"=>"Other"}, "manufacturer"=>"innotek GmbH", "product"=>{"name"=>"VirtualBox", "serial_number"=>"0", "uuid"=>"8B82075A-B071-4035-A96A-3B5D08F6841D"}}, "domain"=>"lan.asio", "facterversion"=>"3.5.1", "filesystems"=>"ext3,iso9660,squashfs", "fqdn"=>"sles11-sp3.lan.asio", "gid"=>"root", "hardwareisa"=>"x86_64", "hardwaremodel"=>"x86_64", "hostname"=>"sles11-sp3", "id"=>"root", "identity"=>{"gid"=>0, "group"=>"root", "privileged"=>true, "uid"=>0, "user"=>"root"}, "interfaces"=>"eth0,lo", "ipaddress"=>"10.0.2.15", "ipaddress6"=>"fe80::216:3eff:fe48:617f", "ipaddress6_eth0"=>"fe80::216:3eff:fe48:617f", "ipaddress6_lo"=>"::1", "ipaddress_eth0"=>"10.0.2.15", "ipaddress_lo"=>"127.0.0.1", "is_virtual"=>true, "kernel"=>"Linux", "kernelmajversion"=>"3.0", "kernelrelease"=>"3.0.101-0.47.67-default", "kernelversion"=>"3.0.101", "load_averages"=>{"15m"=>0.06, "1m"=>0.18, "5m"=>0.08}, "macaddress"=>"00:16:3e:48:61:7f", "macaddress_eth0"=>"00:16:3e:48:61:7f", "manufacturer"=>"innotek GmbH", "memory"=>{"system"=>{"available"=>"354.30 MiB", "available_bytes"=>371511296, "capacity"=>"27.78%", "total"=>"490.61 MiB", "total_bytes"=>514437120, "used"=>"136.30 MiB", "used_bytes"=>142925824}}, "memoryfree"=>"354.30 MiB", "memoryfree_mb"=>354.30078125, "memorysize"=>"490.61 MiB", "memorysize_mb"=>490.60546875, "mountpoints"=>{"/"=>{"available"=>"47.14 GiB", "available_bytes"=>50611761152, "capacity"=>"4.22%", "device"=>"/dev/sda1", "filesystem"=>"ext3", "options"=>["rw", "relatime", "errors=continue", "barrier=1", "data=ordered"], "size"=>"49.21 GiB", "size_bytes"=>52843638784, "used"=>"2.08 GiB", "used_bytes"=>2231877632}, "/dev/shm"=>{"available"=>"245.29 MiB", "available_bytes"=>257208320, "capacity"=>"0.00%", "device"=>"tmpfs", "filesystem"=>"tmpfs", "options"=>["rw", "relatime"], "size"=>"245.30 MiB", "size_bytes"=>257216512, "used"=>"8.00 KiB", "used_bytes"=>8192}}, "mtu_eth0"=>1500, "mtu_lo"=>16436, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "netmask6_eth0"=>"ffff:ffff:ffff:ffff::", "netmask6_lo"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "netmask_eth0"=>"255.255.255.0", "netmask_lo"=>"255.0.0.0", "network"=>"10.0.2.0", "network6"=>"fe80::", "network6_eth0"=>"fe80::", "network6_lo"=>"::1", "network_eth0"=>"10.0.2.0", "network_lo"=>"127.0.0.0", "networking"=>{"domain"=>"lan.asio", "fqdn"=>"sles11-sp3.lan.asio", "hostname"=>"sles11-sp3", "interfaces"=>{"eth0"=>{"bindings"=>[{"address"=>"10.0.2.15", "netmask"=>"255.255.255.0", "network"=>"10.0.2.0"}], "bindings6"=>[{"address"=>"fe80::216:3eff:fe48:617f", "netmask"=>"ffff:ffff:ffff:ffff::", "network"=>"fe80::"}], "ip"=>"10.0.2.15", "ip6"=>"fe80::216:3eff:fe48:617f", "mac"=>"00:16:3e:48:61:7f", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::"}, "lo"=>{"bindings"=>[{"address"=>"127.0.0.1", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}, {"address"=>"127.0.0.2", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}], "bindings6"=>[{"address"=>"::1", "netmask"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "network"=>"::1"}], "ip"=>"127.0.0.1", "ip6"=>"::1", "mtu"=>16436, "netmask"=>"255.0.0.0", "netmask6"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "network"=>"127.0.0.0", "network6"=>"::1"}}, "ip"=>"10.0.2.15", "ip6"=>"fe80::216:3eff:fe48:617f", "mac"=>"00:16:3e:48:61:7f", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::", "primary"=>"eth0"}, "operatingsystem"=>"SLES", "operatingsystemmajrelease"=>"11", "operatingsystemrelease"=>"11.3", "os"=>{"architecture"=>"x86_64", "family"=>"Suse", "hardware"=>"x86_64", "name"=>"SLES", "release"=>{"full"=>"11.3", "major"=>"11", "minor"=>"3"}, "selinux"=>{"enabled"=>false}}, "osfamily"=>"Suse", "partitions"=>{"/dev/sda1"=>{"filesystem"=>"ext3", "mount"=>"/", "size"=>"50.00 GiB", "size_bytes"=>53686042624, "uuid"=>"586adc21-9cfc-4e12-93e6-c711ab2400b1"}}, "path"=>"/usr/bin:/bin:/usr/sbin:/sbin", "physicalprocessorcount"=>1, "processor0"=>"Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz", "processorcount"=>1, "processors"=>{"count"=>1, "isa"=>"x86_64", "models"=>["Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz"], "physicalcount"=>1}, "productname"=>"VirtualBox", "puppetversion"=>"4.8.2", "ruby"=>{"platform"=>"x86_64-linux", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.9"}, "rubyplatform"=>"x86_64-linux", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.9", "selinux"=>false, "serialnumber"=>"0", "ssh"=>{"dsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 2 1 2f39a5ddd25d30676bceb1b99faec8330cb80cd5", "sha256"=>"SSHFP 2 2 d17b59f49908df6bd337918a31a4e38f8489a0c46ada06963cb67ab3a4bdfb11"}, "key"=>"AAAAB3NzaC1kc3MAAACBALvEn/P3Kfg/yFWplaqFsrUOk/Kh9aOZTNNCoJX7lsSQkWpLDkjz03IZZ1pUsykZp6HUhzfW1ZCOKme5503MAsflB78fjgsfGaVL2IcWOvPhurC8SXGivanS5+rL3CFqja/+nMJBPFg8oEyjJei6RJZCQtlEFSEJziKMVI368fxLAAAAFQCC8c+IrxPZc4zVe5EF6qsPnZtMiwAAAIEApfv1xS6ECWq1f8J43BXFdiRszBXQecgdPtf6STvabnYdLKScAPyu3JdosrPswlZWEXLz+srkqqai6xISeSxLKrlY570GNVPmgnBFmoz+iJRi6kakroNe5xjGT45aTyZ16cyg9LFHFLL3KadlzZXu+9XwS9kv09SFlvH6+9+XNGMAAACBALLbpqIZKISARdnFviWOWzFbvYzZHiO3ddAYnXVCGfW1ywmGDqc5kUNTZsBFNYVA56YcaHR/kwFHjOij3SJnvy6VxSG9sSZ4wex/FGBmTUmklelZQsywITGps3MWxiyO3TGfIEXJlqgyVxXZhXnIshN//NCCPbq2X7X7VyTyGjhI"}, "ecdsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 3 1 7fc0ef4bb2d2d14db8fc0bc0b1b97a9d83c6dc17", "sha256"=>"SSHFP 3 2 a0b01ecd2461ed45e0b51ebec48f79957a9710c3ec441cde0e6c4e5d8939c15e"}, "key"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK9w38lDcCpjkGqrTdhhsZCVzS2XKgC6Q9fTvkZn1RLhvvWjDBHyFg0KyTAqfepMNNjdgHqEBFumKc3w+L5xLuY="}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 20cdd84628cfad3edff17edf9ce3c2f7f1756f41", "sha256"=>"SSHFP 1 2 f48e7e96ed7708c6225367ada2a29309f159a12443eeaed6c86efee0660f3f78"}, "key"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQC2nt/gDBidRKDNUmDDThXA+mMWQxq83odOXzx4/3NHMMfIfu3nuvcCaTI+Tp1EiNcbb6Q2ummoGdJpCXT6/W4cjfluuun1rBDeQzzFfthdBAasNKbSCy+cYKwda0zfP9X4Az0SqsbHM5DekNS0w0stCB+L5qqlhaKyunyid2PaeLfSalP5RbcAxGSy5ijLNcAZqbuNOEiq1v0IIySCPplvzvEv//Ht8PhPhXQiRRtKMeq5pAgqjLeUq5zRlXIVqTYfZPfa5tuteaZNxpRxbDvog7h57LWsHKZSjc8ND2ocoehIymNeL4kpFkLg6TMm6BEEOEks5Kue/SXdYUbHkRKN"}}, "sshdsakey"=>"AAAAB3NzaC1kc3MAAACBALvEn/P3Kfg/yFWplaqFsrUOk/Kh9aOZTNNCoJX7lsSQkWpLDkjz03IZZ1pUsykZp6HUhzfW1ZCOKme5503MAsflB78fjgsfGaVL2IcWOvPhurC8SXGivanS5+rL3CFqja/+nMJBPFg8oEyjJei6RJZCQtlEFSEJziKMVI368fxLAAAAFQCC8c+IrxPZc4zVe5EF6qsPnZtMiwAAAIEApfv1xS6ECWq1f8J43BXFdiRszBXQecgdPtf6STvabnYdLKScAPyu3JdosrPswlZWEXLz+srkqqai6xISeSxLKrlY570GNVPmgnBFmoz+iJRi6kakroNe5xjGT45aTyZ16cyg9LFHFLL3KadlzZXu+9XwS9kv09SFlvH6+9+XNGMAAACBALLbpqIZKISARdnFviWOWzFbvYzZHiO3ddAYnXVCGfW1ywmGDqc5kUNTZsBFNYVA56YcaHR/kwFHjOij3SJnvy6VxSG9sSZ4wex/FGBmTUmklelZQsywITGps3MWxiyO3TGfIEXJlqgyVxXZhXnIshN//NCCPbq2X7X7VyTyGjhI", "sshecdsakey"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBK9w38lDcCpjkGqrTdhhsZCVzS2XKgC6Q9fTvkZn1RLhvvWjDBHyFg0KyTAqfepMNNjdgHqEBFumKc3w+L5xLuY=", "sshfp_dsa"=>"SSHFP 2 1 2f39a5ddd25d30676bceb1b99faec8330cb80cd5\nSSHFP 2 2 d17b59f49908df6bd337918a31a4e38f8489a0c46ada06963cb67ab3a4bdfb11", "sshfp_ecdsa"=>"SSHFP 3 1 7fc0ef4bb2d2d14db8fc0bc0b1b97a9d83c6dc17\nSSHFP 3 2 a0b01ecd2461ed45e0b51ebec48f79957a9710c3ec441cde0e6c4e5d8939c15e", "sshfp_rsa"=>"SSHFP 1 1 20cdd84628cfad3edff17edf9ce3c2f7f1756f41\nSSHFP 1 2 f48e7e96ed7708c6225367ada2a29309f159a12443eeaed6c86efee0660f3f78", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQC2nt/gDBidRKDNUmDDThXA+mMWQxq83odOXzx4/3NHMMfIfu3nuvcCaTI+Tp1EiNcbb6Q2ummoGdJpCXT6/W4cjfluuun1rBDeQzzFfthdBAasNKbSCy+cYKwda0zfP9X4Az0SqsbHM5DekNS0w0stCB+L5qqlhaKyunyid2PaeLfSalP5RbcAxGSy5ijLNcAZqbuNOEiq1v0IIySCPplvzvEv//Ht8PhPhXQiRRtKMeq5pAgqjLeUq5zRlXIVqTYfZPfa5tuteaZNxpRxbDvog7h57LWsHKZSjc8ND2ocoehIymNeL4kpFkLg6TMm6BEEOEks5Kue/SXdYUbHkRKN", "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>524, "uptime"=>"0:08 hours"}, "timezone"=>"UTC", "uptime"=>"0:08 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>524, "uuid"=>"8B82075A-B071-4035-A96A-3B5D08F6841D", "virtual"=>"virtualbox", "clientcert"=>"sles11-sp3.lan.asio", "clientversion"=>"4.8.2", "clientnoop"=>false}
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
$onceover_node  = 'SLES-11.3-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

