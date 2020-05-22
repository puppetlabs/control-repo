require 'spec_helper'

describe "role::windows" do

  context "using fact set RHEL-7.4" do
    node_facts = {"aio_agent_version"=>"6.0.9", "architecture"=>"x86_64", "augeas"=>{"version"=>"1.11.0"}, "augeasversion"=>"1.11.0", "bios_release_date"=>"06/02/2017", "bios_vendor"=>"American Megatrends Inc.", "bios_version"=>"090007", "blockdevice_fd0_size"=>4096, "blockdevice_sda_model"=>"Virtual Disk", "blockdevice_sda_size"=>34359738368, "blockdevice_sda_vendor"=>"Msft", "blockdevice_sdb_model"=>"Virtual Disk", "blockdevice_sdb_size"=>53687091200, "blockdevice_sdb_vendor"=>"Msft", "blockdevice_sr0_model"=>"Virtual CD/ROM", "blockdevice_sr0_size"=>643072, "blockdevice_sr0_vendor"=>"Msft", "blockdevices"=>"fd0,sda,sdb,sr0", "boardmanufacturer"=>"Microsoft Corporation", "boardproductname"=>"Virtual Machine", "boardserialnumber"=>"0000-0010-6006-7746-5828-7871-43", "chassisassettag"=>"7783-7084-3265-9085-8269-3286-77", "chassistype"=>"Desktop", "dhcp_servers"=>{"eth0"=>"168.63.129.16", "system"=>"168.63.129.16"}, "disks"=>{"fd0"=>{"size"=>"4.00 KiB", "size_bytes"=>4096}, "sda"=>{"model"=>"Virtual Disk", "size"=>"32.00 GiB", "size_bytes"=>34359738368, "vendor"=>"Msft"}, "sdb"=>{"model"=>"Virtual Disk", "size"=>"50.00 GiB", "size_bytes"=>53687091200, "vendor"=>"Msft"}, "sr0"=>{"model"=>"Virtual CD/ROM", "size"=>"628.00 KiB", "size_bytes"=>643072, "vendor"=>"Msft"}}, "dmi"=>{"bios"=>{"release_date"=>"06/02/2017", "vendor"=>"American Megatrends Inc.", "version"=>"090007"}, "board"=>{"manufacturer"=>"Microsoft Corporation", "product"=>"Virtual Machine", "serial_number"=>"0000-0010-6006-7746-5828-7871-43"}, "chassis"=>{"asset_tag"=>"7783-7084-3265-9085-8269-3286-77", "type"=>"Desktop"}, "manufacturer"=>"Microsoft Corporation", "product"=>{"name"=>"Virtual Machine", "serial_number"=>"0000-0017-8302-7891-2115-8198-39", "uuid"=>"33E071F7-CDA2-3F45-931D-2BFD893683C7"}}, "domain"=>"104sjco4dnxe3mx0wbzfwnbl1h.gx.internal.cloudapp.net", "facterversion"=>"3.12.4", "filesystems"=>"ext2,ext3,ext4,udf,xfs", "fips_enabled"=>false, "fqdn"=>"rhel7test.104sjco4dnxe3mx0wbzfwnbl1h.gx.internal.cloudapp.net", "gid"=>"root", "hardwareisa"=>"x86_64", "hardwaremodel"=>"x86_64", "hostname"=>"rhel7test", "hypervisors"=>{"hyperv"=>{}}, "id"=>"root", "identity"=>{"gid"=>0, "group"=>"root", "privileged"=>true, "uid"=>0, "user"=>"root"}, "interfaces"=>"eth0,lo", "ipaddress"=>"10.0.0.6", "ipaddress6"=>"fe80::20d:3aff:fe90:5780", "ipaddress6_eth0"=>"fe80::20d:3aff:fe90:5780", "ipaddress6_lo"=>"::1", "ipaddress_eth0"=>"10.0.0.6", "ipaddress_lo"=>"127.0.0.1", "is_virtual"=>true, "kernel"=>"Linux", "kernelmajversion"=>"3.10", "kernelrelease"=>"3.10.0-693.46.1.el7.x86_64", "kernelversion"=>"3.10.0", "load_averages"=>{"15m"=>0.08, "1m"=>0.32, "5m"=>0.19}, "macaddress"=>"00:0d:3a:90:57:80", "macaddress_eth0"=>"00:0d:3a:90:57:80", "manufacturer"=>"Microsoft Corporation", "memory"=>{"swap"=>{"available"=>"2.00 GiB", "available_bytes"=>2147479552, "capacity"=>"0%", "total"=>"2.00 GiB", "total_bytes"=>2147479552, "used"=>"0 bytes", "used_bytes"=>0}, "system"=>{"available"=>"7.42 GiB", "available_bytes"=>7963906048, "capacity"=>"4.67%", "total"=>"7.78 GiB", "total_bytes"=>8353742848, "used"=>"371.78 MiB", "used_bytes"=>389836800}}, "memoryfree"=>"7.42 GiB", "memoryfree_mb"=>7594.97265625, "memorysize"=>"7.78 GiB", "memorysize_mb"=>7966.75, "mountpoints"=>{"/"=>{"available"=>"29.95 GiB", "available_bytes"=>32156790784, "capacity"=>"4.91%", "device"=>"/dev/sda2", "filesystem"=>"xfs", "options"=>["rw", "seclabel", "relatime", "attr2", "inode64", "noquota"], "size"=>"31.50 GiB", "size_bytes"=>33817882624, "used"=>"1.55 GiB", "used_bytes"=>1661091840}, "/boot"=>{"available"=>"393.75 MiB", "available_bytes"=>412880896, "capacity"=>"20.72%", "device"=>"/dev/sda1", "filesystem"=>"xfs", "options"=>["rw", "seclabel", "relatime", "attr2", "inode64", "noquota"], "size"=>"496.66 MiB", "size_bytes"=>520785920, "used"=>"102.91 MiB", "used_bytes"=>107905024}, "/dev/shm"=>{"available"=>"3.89 GiB", "available_bytes"=>4176871424, "capacity"=>"0%", "device"=>"tmpfs", "filesystem"=>"tmpfs", "options"=>["rw", "seclabel", "nosuid", "nodev"], "size"=>"3.89 GiB", "size_bytes"=>4176871424, "used"=>"0 bytes", "used_bytes"=>0}, "/mnt/resource"=>{"available"=>"47.04 GiB", "available_bytes"=>50506170368, "capacity"=>"4.18%", "device"=>"/dev/sdb1", "filesystem"=>"ext4", "options"=>["rw", "seclabel", "relatime", "data=ordered"], "size"=>"49.09 GiB", "size_bytes"=>52708212736, "used"=>"2.05 GiB", "used_bytes"=>2202042368}, "/run"=>{"available"=>"3.88 GiB", "available_bytes"=>4168146944, "capacity"=>"0.21%", "device"=>"tmpfs", "filesystem"=>"tmpfs", "options"=>["rw", "seclabel", "nosuid", "nodev", "mode=755"], "size"=>"3.89 GiB", "size_bytes"=>4176871424, "used"=>"8.32 MiB", "used_bytes"=>8724480}, "/run/user/1000"=>{"available"=>"796.68 MiB", "available_bytes"=>835375104, "capacity"=>"0%", "device"=>"tmpfs", "filesystem"=>"tmpfs", "options"=>["rw", "seclabel", "nosuid", "nodev", "relatime", "size=815796k", "mode=700", "uid=1000", "gid=1000"], "size"=>"796.68 MiB", "size_bytes"=>835375104, "used"=>"0 bytes", "used_bytes"=>0}, "/sys/fs/cgroup"=>{"available"=>"3.89 GiB", "available_bytes"=>4176871424, "capacity"=>"0%", "device"=>"tmpfs", "filesystem"=>"tmpfs", "options"=>["ro", "seclabel", "nosuid", "nodev", "noexec", "mode=755"], "size"=>"3.89 GiB", "size_bytes"=>4176871424, "used"=>"0 bytes", "used_bytes"=>0}}, "mtu_eth0"=>1500, "mtu_lo"=>65536, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "netmask6_eth0"=>"ffff:ffff:ffff:ffff::", "netmask6_lo"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "netmask_eth0"=>"255.255.255.0", "netmask_lo"=>"255.0.0.0", "network"=>"10.0.0.0", "network6"=>"fe80::", "network6_eth0"=>"fe80::", "network6_lo"=>"::1", "network_eth0"=>"10.0.0.0", "network_lo"=>"127.0.0.0", "networking"=>{"dhcp"=>"168.63.129.16", "domain"=>"104sjco4dnxe3mx0wbzfwnbl1h.gx.internal.cloudapp.net", "fqdn"=>"rhel7test.104sjco4dnxe3mx0wbzfwnbl1h.gx.internal.cloudapp.net", "hostname"=>"rhel7test", "interfaces"=>{"eth0"=>{"bindings"=>[{"address"=>"10.0.0.6", "netmask"=>"255.255.255.0", "network"=>"10.0.0.0"}], "bindings6"=>[{"address"=>"fe80::20d:3aff:fe90:5780", "netmask"=>"ffff:ffff:ffff:ffff::", "network"=>"fe80::"}], "dhcp"=>"168.63.129.16", "ip"=>"10.0.0.6", "ip6"=>"fe80::20d:3aff:fe90:5780", "mac"=>"00:0d:3a:90:57:80", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.0.0", "network6"=>"fe80::"}, "lo"=>{"bindings"=>[{"address"=>"127.0.0.1", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}], "bindings6"=>[{"address"=>"::1", "netmask"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "network"=>"::1"}], "ip"=>"127.0.0.1", "ip6"=>"::1", "mtu"=>65536, "netmask"=>"255.0.0.0", "netmask6"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "network"=>"127.0.0.0", "network6"=>"::1"}}, "ip"=>"10.0.0.6", "ip6"=>"fe80::20d:3aff:fe90:5780", "mac"=>"00:0d:3a:90:57:80", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.0.0", "network6"=>"fe80::", "primary"=>"eth0"}, "operatingsystem"=>"RedHat", "operatingsystemmajrelease"=>"7", "operatingsystemrelease"=>"7.4", "os"=>{"architecture"=>"x86_64", "family"=>"RedHat", "hardware"=>"x86_64", "name"=>"RedHat", "release"=>{"full"=>"7.4", "major"=>"7", "minor"=>"4"}, "selinux"=>{"config_mode"=>"enforcing", "config_policy"=>"targeted", "current_mode"=>"enforcing", "enabled"=>true, "enforced"=>true, "policy_version"=>"28"}}, "osfamily"=>"RedHat", "partitions"=>{"/dev/sda1"=>{"filesystem"=>"xfs", "mount"=>"/boot", "size"=>"500.00 MiB", "size_bytes"=>524288000, "uuid"=>"b3f65ad5-0571-4ae4-937a-13ef2fda43e3"}, "/dev/sda2"=>{"filesystem"=>"xfs", "mount"=>"/", "size"=>"31.51 GiB", "size_bytes"=>33834401792, "uuid"=>"e9643aa4-b339-43c4-afc5-fcac22af1584"}, "/dev/sdb1"=>{"filesystem"=>"ext4", "mount"=>"/mnt/resource", "size"=>"50.00 GiB", "size_bytes"=>53684994048, "uuid"=>"07908b37-1661-4130-9d5a-e1fdb0a4bdb2"}}, "path"=>"/sbin:/bin:/usr/sbin:/usr/bin", "physicalprocessorcount"=>1, "processor0"=>"Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz", "processor1"=>"Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz", "processorcount"=>2, "processors"=>{"count"=>2, "isa"=>"x86_64", "models"=>["Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz", "Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz"], "physicalcount"=>1}, "productname"=>"Virtual Machine", "puppetversion"=>"6.0.9", "ruby"=>{"platform"=>"x86_64-linux", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.5.0", "version"=>"2.5.3"}, "rubyplatform"=>"x86_64-linux", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.5.0", "rubyversion"=>"2.5.3", "selinux"=>true, "selinux_config_mode"=>"enforcing", "selinux_config_policy"=>"targeted", "selinux_current_mode"=>"enforcing", "selinux_enforced"=>true, "selinux_policyversion"=>"28", "serialnumber"=>"0000-0017-8302-7891-2115-8198-39", "ssh"=>{"ecdsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 3 1 8b4b534a70cc57bfbebb88a6d980c397fa9dddf7", "sha256"=>"SSHFP 3 2 ab2e72961bc6515482c34e7c8358f929026fc8af979d5a9fa16bd9a25bf4bcb2"}, "key"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMYggL8slLxRmDxaMceOJ4c8pVKIVA4uUZ4b4jPo7+s8xUHEZkngmqSfHGJpJ4uaDSwO4rNOYVAyCZVK4sDJBuU=", "type"=>"ecdsa-sha2-nistp256"}, "ed25519"=>{"fingerprints"=>{"sha1"=>"SSHFP 4 1 559ecc22a9b45200bd56dd86455250e203668929", "sha256"=>"SSHFP 4 2 d005f680bbb24dc3c670c16d4cc87a59a871c4bed2763a17141b03d10d480282"}, "key"=>"AAAAC3NzaC1lZDI1NTE5AAAAINswqLjeLueVwG3UgsjhTNQGUg2Y7zayfIXJd783I44K", "type"=>"ssh-ed25519"}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 ec0afe862095855d6ca6174cceec173e241afe6a", "sha256"=>"SSHFP 1 2 af54fb6de7ea67ba7e8b93f99af27d7984dc02224aee7de886d269797ae64b11"}, "key"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDHfGHvDLYXMARhNOK21bV8ZWnwOSxtAcdenfMP/wVlLshAPtqXMzXiDeaFJKfXrKMuiP3aWEbqtERPQnmu+AGfvOekwM6YoHIHCszhnP4ASSpITEuY3ZgVM6qQLgdClBMSdbEoHQ2f6Lem3Uy/7fekA1ofvofp6BtqO5s/Sk3zQhYhDS/TfSw2wlB6J/VrmOimnqhoMq6JLDFJtbYtBFFPqlpf5CZfzOXwAGBnoAuSRO7rtRzXE7caAHMRAdFWlGX1S5zzCJueUyQm3cVvMfqyjbGWJmxDbtIUaDpE+63jLwMidaSu1ZF0Q3mMRvPP0x/g8EZ+EnATl5rPYvVJqcq1", "type"=>"ssh-rsa"}}, "sshecdsakey"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMYggL8slLxRmDxaMceOJ4c8pVKIVA4uUZ4b4jPo7+s8xUHEZkngmqSfHGJpJ4uaDSwO4rNOYVAyCZVK4sDJBuU=", "sshed25519key"=>"AAAAC3NzaC1lZDI1NTE5AAAAINswqLjeLueVwG3UgsjhTNQGUg2Y7zayfIXJd783I44K", "sshfp_ecdsa"=>"SSHFP 3 1 8b4b534a70cc57bfbebb88a6d980c397fa9dddf7\nSSHFP 3 2 ab2e72961bc6515482c34e7c8358f929026fc8af979d5a9fa16bd9a25bf4bcb2", "sshfp_ed25519"=>"SSHFP 4 1 559ecc22a9b45200bd56dd86455250e203668929\nSSHFP 4 2 d005f680bbb24dc3c670c16d4cc87a59a871c4bed2763a17141b03d10d480282", "sshfp_rsa"=>"SSHFP 1 1 ec0afe862095855d6ca6174cceec173e241afe6a\nSSHFP 1 2 af54fb6de7ea67ba7e8b93f99af27d7984dc02224aee7de886d269797ae64b11", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDHfGHvDLYXMARhNOK21bV8ZWnwOSxtAcdenfMP/wVlLshAPtqXMzXiDeaFJKfXrKMuiP3aWEbqtERPQnmu+AGfvOekwM6YoHIHCszhnP4ASSpITEuY3ZgVM6qQLgdClBMSdbEoHQ2f6Lem3Uy/7fekA1ofvofp6BtqO5s/Sk3zQhYhDS/TfSw2wlB6J/VrmOimnqhoMq6JLDFJtbYtBFFPqlpf5CZfzOXwAGBnoAuSRO7rtRzXE7caAHMRAdFWlGX1S5zzCJueUyQm3cVvMfqyjbGWJmxDbtIUaDpE+63jLwMidaSu1ZF0Q3mMRvPP0x/g8EZ+EnATl5rPYvVJqcq1", "swapfree"=>"2.00 GiB", "swapfree_mb"=>2047.99609375, "swapsize"=>"2.00 GiB", "swapsize_mb"=>2047.99609375, "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>215, "uptime"=>"0:03 hours"}, "timezone"=>"UTC", "uptime"=>"0:03 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>215, "uuid"=>"33E071F7-CDA2-3F45-931D-2BFD893683C7", "virtual"=>"hyperv", "clientcert"=>"rhel7test.104sjco4dnxe3mx0wbzfwnbl1h.gx.internal.cloudapp.net", "clientversion"=>"6.0.9", "clientnoop"=>false}
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
$onceover_node  = 'RHEL-7.4'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

