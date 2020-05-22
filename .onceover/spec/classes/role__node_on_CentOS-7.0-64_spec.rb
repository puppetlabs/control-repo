require 'spec_helper'

describe "role::node" do

  context "using fact set CentOS-7.0-64" do
    node_facts = {"aio_agent_build"=>"1.2.2", "aio_agent_version"=>"1.2.2", "architecture"=>"x86_64", "augeas"=>{"version"=>"1.4.0"}, "augeasversion"=>"1.4.0", "bios_release_date"=>"12/01/2006", "bios_vendor"=>"innotek GmbH", "bios_version"=>"VirtualBox", "blockdevice_sda_model"=>"VBOX HARDDISK", "blockdevice_sda_size"=>21474836480, "blockdevice_sda_vendor"=>"ATA", "blockdevices"=>"sda", "boardmanufacturer"=>"Oracle Corporation", "boardproductname"=>"VirtualBox", "boardserialnumber"=>"0", "chassistype"=>"Other", "concat_basedir"=>"/opt/puppetlabs/puppet/cache/concat", "custom_auth_conf"=>"false", "datacenter"=>"sydney", "dhcp_servers"=>{"enp0s3"=>"10.0.2.2", "enp0s8"=>"192.168.56.100", "system"=>"10.0.2.2"}, "disks"=>{"sda"=>{"model"=>"VBOX HARDDISK", "size"=>"20.00 GiB", "size_bytes"=>21474836480, "vendor"=>"ATA"}}, "dmi"=>{"bios"=>{"release_date"=>"12/01/2006", "vendor"=>"innotek GmbH", "version"=>"VirtualBox"}, "board"=>{"manufacturer"=>"Oracle Corporation", "product"=>"VirtualBox", "serial_number"=>"0"}, "chassis"=>{"type"=>"Other"}, "manufacturer"=>"innotek GmbH", "product"=>{"name"=>"VirtualBox", "serial_number"=>"0", "uuid"=>"9D7BE471-F3DA-47EE-B023-F659129270EF"}}, "domain"=>"syd.puppetlabs.demo", "facterversion"=>"3.0.2", "filesystems"=>"xfs", "fqdn"=>"centos7b.syd.puppetlabs.demo", "gid"=>"root", "hardwareisa"=>"x86_64", "hardwaremodel"=>"x86_64", "homedir"=>"/root", "hostname"=>"centos7b", "id"=>"root", "identity"=>{"gid"=>0, "group"=>"root", "uid"=>0, "user"=>"root"}, "interfaces"=>"enp0s3,enp0s8,lo", "ip6tables_version"=>"1.4.21", "ipaddress"=>"10.0.2.15", "ipaddress6"=>"fe80::a00:27ff:fe39:183c", "ipaddress6_enp0s3"=>"fe80::a00:27ff:fe39:183c", "ipaddress6_enp0s8"=>"fe80::a00:27ff:fe39:832c", "ipaddress6_lo"=>"::1", "ipaddress_enp0s3"=>"10.0.2.15", "ipaddress_enp0s8"=>"10.20.1.92", "ipaddress_lo"=>"127.0.0.1", "iptables_version"=>"1.4.21", "is_admin"=>true, "is_pe"=>false, "is_virtual"=>true, "kernel"=>"Linux", "kernelmajversion"=>"3.10", "kernelrelease"=>"3.10.0-123.el7.x86_64", "kernelversion"=>"3.10.0", "load_averages"=>{"15m"=>0.05, "1m"=>0.26, "5m"=>0.12}, "macaddress"=>"08:00:27:39:18:3c", "macaddress_enp0s3"=>"08:00:27:39:18:3c", "macaddress_enp0s8"=>"08:00:27:39:83:2c", "manufacturer"=>"innotek GmbH", "memory"=>{"swap"=>{"available"=>"1.03 GiB", "available_bytes"=>1107292160, "capacity"=>"0%", "total"=>"1.03 GiB", "total_bytes"=>1107292160, "used"=>"0 bytes", "used_bytes"=>0}, "system"=>{"available"=>"297.76 MiB", "available_bytes"=>312225792, "capacity"=>"39.28%", "total"=>"490.41 MiB", "total_bytes"=>514228224, "used"=>"192.64 MiB", "used_bytes"=>202002432}}, "memoryfree"=>"297.76 MiB", "memoryfree_mb"=>297.76171875, "memorysize"=>"490.41 MiB", "memorysize_mb"=>490.40625, "mountpoints"=>{"/"=>{"available"=>"17.30 GiB", "available_bytes"=>18574749696, "capacity"=>"6.32%", "device"=>"/dev/mapper/centos-root", "filesystem"=>"xfs", "options"=>["rw", "relatime", "attr2", "inode64", "noquota"], "size"=>"18.47 GiB", "size_bytes"=>19828572160, "used"=>"1.17 GiB", "used_bytes"=>1253822464}, "/boot"=>{"available"=>"393.11 MiB", "available_bytes"=>412209152, "capacity"=>"20.85%", "device"=>"/dev/sda1", "filesystem"=>"xfs", "options"=>["rw", "relatime", "attr2", "inode64", "noquota"], "size"=>"496.67 MiB", "size_bytes"=>520794112, "used"=>"103.55 MiB", "used_bytes"=>108584960}}, "mtu_enp0s3"=>1500, "mtu_enp0s8"=>1500, "mtu_lo"=>65536, "mysql_server_id"=>8563388, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "netmask6_enp0s3"=>"ffff:ffff:ffff:ffff::", "netmask6_enp0s8"=>"ffff:ffff:ffff:ffff::", "netmask6_lo"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "netmask_enp0s3"=>"255.255.255.0", "netmask_enp0s8"=>"255.255.255.0", "netmask_lo"=>"255.0.0.0", "network"=>"10.0.2.0", "network6"=>"fe80::", "network6_enp0s3"=>"fe80::", "network6_enp0s8"=>"fe80::", "network6_lo"=>"::1", "network_enp0s3"=>"10.0.2.0", "network_enp0s8"=>"10.20.1.0", "network_lo"=>"127.0.0.0", "networking"=>{"dhcp"=>"10.0.2.2", "domain"=>"syd.puppetlabs.demo", "fqdn"=>"centos7b.syd.puppetlabs.demo", "hostname"=>"centos7b", "interfaces"=>{"enp0s3"=>{"dhcp"=>"10.0.2.2", "ip"=>"10.0.2.15", "ip6"=>"fe80::a00:27ff:fe39:183c", "mac"=>"08:00:27:39:18:3c", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::"}, "enp0s8"=>{"dhcp"=>"192.168.56.100", "ip"=>"10.20.1.92", "ip6"=>"fe80::a00:27ff:fe39:832c", "mac"=>"08:00:27:39:83:2c", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.20.1.0", "network6"=>"fe80::"}, "lo"=>{"ip"=>"127.0.0.1", "ip6"=>"::1", "mtu"=>65536, "netmask"=>"255.0.0.0", "netmask6"=>"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", "network"=>"127.0.0.0", "network6"=>"::1"}}, "ip"=>"10.0.2.15", "ip6"=>"fe80::a00:27ff:fe39:183c", "mac"=>"08:00:27:39:18:3c", "mtu"=>1500, "netmask"=>"255.255.255.0", "netmask6"=>"ffff:ffff:ffff:ffff::", "network"=>"10.0.2.0", "network6"=>"fe80::"}, "operatingsystem"=>"CentOS", "operatingsystemmajrelease"=>"7", "operatingsystemrelease"=>"7.0.1406", "os"=>{"architecture"=>"x86_64", "family"=>"RedHat", "hardware"=>"x86_64", "name"=>"CentOS", "release"=>{"full"=>"7.0.1406", "major"=>"7", "minor"=>"0"}, "selinux"=>{"enabled"=>false}}, "osfamily"=>"RedHat", "partitions"=>{"/dev/mapper/centos-root"=>{"filesystem"=>"xfs", "mount"=>"/", "size"=>"0 bytes", "size_bytes"=>0, "uuid"=>"db651e5f-a2c2-4236-9570-6226f63e1fcd"}, "/dev/mapper/centos-swap"=>{"filesystem"=>"swap", "size"=>"0 bytes", "size_bytes"=>0, "uuid"=>"ff4ec16c-28c0-4715-846d-11e7c9b4e53b"}, "/dev/sda1"=>{"filesystem"=>"xfs", "mount"=>"/boot", "size"=>"500.00 MiB", "size_bytes"=>524288000, "uuid"=>"39ce4ad1-4e9d-49a4-bce0-8a30b459490a"}, "/dev/sda2"=>{"filesystem"=>"LVM2_member", "size"=>"19.51 GiB", "size_bytes"=>20949499904, "uuid"=>"pg7zVv-M3hI-zpjY-eYlZ-06aD-ZRO2-J30GLd"}}, "path"=>"/opt/puppetlabs/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin", "pe_concat_basedir"=>"/opt/puppetlabs/puppet/cache/pe_concat", "pe_razor_server_version"=>"package pe-razor-server is not installed", "physicalprocessorcount"=>1, "platform_symlink_writable"=>true, "platform_tag"=>"el-7-x86_64", "processor0"=>"Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz", "processorcount"=>1, "processors"=>{"count"=>1, "isa"=>"x86_64", "models"=>["Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz"], "physicalcount"=>1}, "productname"=>"VirtualBox", "puppet_files_dir_present"=>false, "puppet_vardir"=>"/opt/puppetlabs/puppet/cache", "puppetversion"=>"4.2.1", "root_home"=>"/root", "ruby"=>{"platform"=>"x86_64-linux", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.6"}, "rubyplatform"=>"x86_64-linux", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.6", "selinux"=>false, "serialnumber"=>"0", "ssh"=>{"ecdsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 3 1 91edfdf5e7e098f4392606865c017dabc26804bb", "sha256"=>"SSHFP 3 2 f00c65a1884bfec52db11de89254f0bfd46baf9e759546654c94371a05ee0dba"}, "key"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBcSUcHQOfBDZElr6PBmxc/4ZDaIhsugXM7OE2SQj35iOMCN/I3XfINMo8SvBIQ6CsBqPnzgbKRBs7e1FPFnsT4="}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 f25e9ad2faddbe75263cfee4fa97dc965bc1d581", "sha256"=>"SSHFP 1 2 0173e386031a134e4cbfb7f6971788761a5aa3d9e39dafcf163f003de2537199"}, "key"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDLMo35gwbuqQvRq1gy6L8vddeyMNBYr5WPVcftMKSJR1jmwzxcZ+h0AEb3KPfoMHkqe9Xy+3oN981qe5ZCE780HO884AaXzXry9zdWQjGysrI+zHQbqbpOkYAGsVbJiQ7VnH7lMVZo2jCbABj4OdsbeCOeP3oDXTNCTaWWdQChzqvYgNBvb0mg/na1l0naQ1nsJYD85O8ZRQ9U/JOADMaOjummfOb2z7MgskZ9abm5eFCCQl+wUUNXKqQx+uyVM4lyyoTHpW3M2IV0P9wxhWJF6eovwyREGuMgJCs6kbHCFty7HtAYbzziabgQav8pMe68aBqjshbpU6ll/+aXWhD1"}}, "sshecdsakey"=>"AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBcSUcHQOfBDZElr6PBmxc/4ZDaIhsugXM7OE2SQj35iOMCN/I3XfINMo8SvBIQ6CsBqPnzgbKRBs7e1FPFnsT4=", "sshfp_ecdsa"=>"SSHFP 3 1 91edfdf5e7e098f4392606865c017dabc26804bb\nSSHFP 3 2 f00c65a1884bfec52db11de89254f0bfd46baf9e759546654c94371a05ee0dba", "sshfp_rsa"=>"SSHFP 1 1 f25e9ad2faddbe75263cfee4fa97dc965bc1d581\nSSHFP 1 2 0173e386031a134e4cbfb7f6971788761a5aa3d9e39dafcf163f003de2537199", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAADAQABAAABAQDLMo35gwbuqQvRq1gy6L8vddeyMNBYr5WPVcftMKSJR1jmwzxcZ+h0AEb3KPfoMHkqe9Xy+3oN981qe5ZCE780HO884AaXzXry9zdWQjGysrI+zHQbqbpOkYAGsVbJiQ7VnH7lMVZo2jCbABj4OdsbeCOeP3oDXTNCTaWWdQChzqvYgNBvb0mg/na1l0naQ1nsJYD85O8ZRQ9U/JOADMaOjummfOb2z7MgskZ9abm5eFCCQl+wUUNXKqQx+uyVM4lyyoTHpW3M2IV0P9wxhWJF6eovwyREGuMgJCs6kbHCFty7HtAYbzziabgQav8pMe68aBqjshbpU6ll/+aXWhD1", "staging_http_get"=>"curl", "swapfree"=>"1.03 GiB", "swapfree_mb"=>1055.99609375, "swapsize"=>"1.03 GiB", "swapsize_mb"=>1055.99609375, "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>78, "uptime"=>"0:01 hours"}, "timezone"=>"UTC", "uptime"=>"0:01 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>78, "uuid"=>"9D7BE471-F3DA-47EE-B023-F659129270EF", "virtual"=>"virtualbox", "clientcert"=>"centos7b.syd.puppetlabs.demo", "clientversion"=>"4.2.1", "clientnoop"=>false}
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
$onceover_class = 'role::node'
$onceover_node  = 'CentOS-7.0-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

