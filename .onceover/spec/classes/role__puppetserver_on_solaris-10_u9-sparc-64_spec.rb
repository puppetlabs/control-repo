require 'spec_helper'

describe "role::puppetserver" do

  context "using fact set solaris-10_u9-sparc-64" do
    node_facts = {"aio_agent_build"=>"1.4.2", "aio_agent_version"=>"1.4.2", "architecture"=>"sun4v", "augeas"=>{"version"=>"1.4.0"}, "augeasversion"=>"1.4.0", "blockdevice_sd4_size"=>-1168154624, "blockdevice_sd4_vendor"=>"HITACHI", "blockdevice_sd5_size"=>-647710720, "blockdevice_sd5_vendor"=>"HITACHI", "blockdevice_sd6_size"=>0, "blockdevice_sd6_vendor"=>"AMI", "blockdevice_sd7_size"=>0, "blockdevice_sd7_vendor"=>"TEAC", "blockdevice_sd8_size"=>-1168154624, "blockdevice_sd8_vendor"=>"HITACHI", "blockdevice_sd9_size"=>-647710720, "blockdevice_sd9_vendor"=>"HITACHI", "blockdevices"=>"sd4,sd5,sd8,sd9,sd7,sd6", "custom_auth_conf"=>false, "disks"=>{"sd4"=>{"product"=>"H109060SESUN600GRevision", "size"=>"558.91 GiB", "size_bytes"=>-1168154624, "vendor"=>"HITACHI"}, "sd5"=>{"product"=>"H109030SESUN300GRevision", "size"=>"279.40 GiB", "size_bytes"=>-647710720, "vendor"=>"HITACHI"}, "sd6"=>{"product"=>"Virtual CDROM   Revision", "size"=>"0 bytes", "size_bytes"=>0, "vendor"=>"AMI"}, "sd7"=>{"product"=>"DV-W28SS-W      Revision", "size"=>"0 bytes", "size_bytes"=>0, "vendor"=>"TEAC"}, "sd8"=>{"product"=>"H109060SESUN600GRevision", "size"=>"558.91 GiB", "size_bytes"=>-1168154624, "vendor"=>"HITACHI"}, "sd9"=>{"product"=>"H109030SESUN300GRevision", "size"=>"279.40 GiB", "size_bytes"=>-647710720, "vendor"=>"HITACHI"}}, "dmi"=>{"manufacturer"=>"Oracle Corporation"}, "domain"=>"puppet.example", "facterversion"=>"3.1.6", "fqdn"=>"solaris-10_u9-sparc-t4-64.puppet.example", "gid"=>"root", "hardwareisa"=>"sparc", "hardwaremodel"=>"sun4v", "hostname"=>"solaris-10_u9-sparc-t4-64", "id"=>"root", "identity"=>{"gid"=>0, "group"=>"root", "uid"=>0, "user"=>"root"}, "interfaces"=>"lo0,net0", "ipaddress"=>"10.32.77.42", "ipaddress_lo0"=>"127.0.0.1", "ipaddress_net0"=>"10.32.77.42", "is_pe"=>false, "is_virtual"=>true, "kernel"=>"SunOS", "kernelmajversion"=>"Generic_Virtual", "kernelrelease"=>"5.10", "kernelversion"=>"Generic_Virtual", "load_averages"=>{"15m"=>1.015625, "1m"=>1.89453125, "5m"=>1.25390625}, "macaddress"=>"02:08:20:f1:97:4b", "macaddress_net0"=>"02:08:20:f1:97:4b", "manufacturer"=>"Oracle Corporation", "memory"=>{"swap"=>{"available"=>"4.00 GiB", "available_bytes"=>-8192, "capacity"=>"0%", "total"=>"4.00 GiB", "total_bytes"=>-8192, "used"=>"0 bytes", "used_bytes"=>0}, "system"=>{"available"=>"3.25 GiB", "available_bytes"=>-806297600, "capacity"=>"78.94%", "total"=>"15.43 GiB", "total_bytes"=>-611737600, "used"=>"12.18 GiB", "used_bytes"=>194560000}}, "memoryfree"=>"3.25 GiB", "memoryfree_mb"=>3327.0546875, "memorysize"=>"15.43 GiB", "memorysize_mb"=>15800.6015625, "mountpoints"=>{"/"=>{"available"=>"474.52 GiB", "available_bytes"=>-1588937216, "capacity"=>"1.14%", "device"=>"rpool/ROOT/zbe-0", "filesystem"=>"zfs", "options"=>["rw", "nodevices", "setuid", "nonbmand", "exec", "rstchown", "xattr", "atime", "mountpoint=/zones/cisparc10/root/", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950161"], "size"=>"480.01 GiB", "size_bytes"=>13566464, "used"=>"5.49 GiB", "used_bytes"=>1602503680}, "/.SUNWnative/lib"=>{"available"=>"212.34 GiB", "available_bytes"=>361699840, "capacity"=>"13.19%", "device"=>"/.SUNWnative/lib", "filesystem"=>"lofs", "options"=>["ro", "nodevices", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950002"], "size"=>"244.59 GiB", "size_bytes"=>629606400, "used"=>"32.25 GiB", "used_bytes"=>267906560}, "/.SUNWnative/platform"=>{"available"=>"212.34 GiB", "available_bytes"=>361699840, "capacity"=>"13.19%", "device"=>"/.SUNWnative/platform", "filesystem"=>"lofs", "options"=>["ro", "nodevices", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950002"], "size"=>"244.59 GiB", "size_bytes"=>629606400, "used"=>"32.25 GiB", "used_bytes"=>267906560}, "/.SUNWnative/sbin"=>{"available"=>"212.34 GiB", "available_bytes"=>361699840, "capacity"=>"13.19%", "device"=>"/.SUNWnative/sbin", "filesystem"=>"lofs", "options"=>["ro", "nodevices", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950002"], "size"=>"244.59 GiB", "size_bytes"=>629606400, "used"=>"32.25 GiB", "used_bytes"=>267906560}, "/.SUNWnative/usr"=>{"available"=>"212.34 GiB", "available_bytes"=>361699840, "capacity"=>"13.19%", "device"=>"/.SUNWnative/usr", "filesystem"=>"lofs", "options"=>["ro", "nodevices", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950002"], "size"=>"244.59 GiB", "size_bytes"=>629606400, "used"=>"32.25 GiB", "used_bytes"=>267906560}, "/dev"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"/dev", "filesystem"=>"dev", "options"=>["zone=cisparc10", "nozonemod", "sharezone=36", "dev=8e0001b"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/dev/fd"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"fd", "filesystem"=>"fd", "options"=>["rw", "nodevices", "rstchown", "zone=cisparc10", "sharezone=36", "dev=9040025"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/etc/mnttab"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"mnttab", "filesystem"=>"mntfs", "options"=>["nodevices", "rstchown", "zone=cisparc10", "sharezone=36", "dev=8e80025"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/etc/svc/volatile"=>{"available"=>"5.48 GiB", "available_bytes"=>1591173120, "capacity"=>"0.01%", "device"=>"swap", "filesystem"=>"tmpfs", "options"=>["nodevices", "rstchown", "xattr", "zone=cisparc10", "sharezone=36", "dev=8ec0049"], "size"=>"5.48 GiB", "size_bytes"=>1591631872, "used"=>"448.00 KiB", "used_bytes"=>458752}, "/export"=>{"available"=>"474.52 GiB", "available_bytes"=>-1588937216, "capacity"=>"0.00%", "device"=>"rpool/export", "filesystem"=>"zfs", "options"=>["rw", "nodevices", "setuid", "nonbmand", "exec", "rstchown", "xattr", "atime", "zone=cisparc10", "sharezone=36", "dev=4950163"], "size"=>"474.52 GiB", "size_bytes"=>-1588904448, "used"=>"32.00 KiB", "used_bytes"=>32768}, "/export/home"=>{"available"=>"474.52 GiB", "available_bytes"=>-1588937216, "capacity"=>"0.00%", "device"=>"rpool/export/home", "filesystem"=>"zfs", "options"=>["rw", "nodevices", "setuid", "nonbmand", "exec", "rstchown", "xattr", "atime", "zone=cisparc10", "sharezone=36", "dev=4950164"], "size"=>"474.52 GiB", "size_bytes"=>-1588905472, "used"=>"31.00 KiB", "used_bytes"=>31744}, "/proc"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"proc", "filesystem"=>"proc", "options"=>["nodevices", "rstchown", "zone=cisparc10", "sharezone=36", "dev=8dc0024"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/rpool"=>{"available"=>"474.52 GiB", "available_bytes"=>-1588937216, "capacity"=>"0.00%", "device"=>"rpool", "filesystem"=>"zfs", "options"=>["rw", "nodevices", "setuid", "nonbmand", "exec", "rstchown", "xattr", "atime", "zone=cisparc10", "sharezone=36", "dev=4950165"], "size"=>"474.52 GiB", "size_bytes"=>-1588905472, "used"=>"31.00 KiB", "used_bytes"=>31744}, "/system/contract"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"ctfs", "filesystem"=>"ctfs", "options"=>["nodevices", "rstchown", "zone=cisparc10", "sharezone=36", "dev=8e40025"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/system/object"=>{"available"=>"0 bytes", "available_bytes"=>0, "capacity"=>"100%", "device"=>"objfs", "filesystem"=>"objfs", "options"=>["nodevices", "rstchown", "zone=cisparc10", "sharezone=36", "dev=8f00025"], "size"=>"0 bytes", "size_bytes"=>0, "used"=>"0 bytes", "used_bytes"=>0}, "/tmp"=>{"available"=>"5.48 GiB", "available_bytes"=>1591173120, "capacity"=>"0.70%", "device"=>"swap", "filesystem"=>"tmpfs", "options"=>["nodevices", "rstchown", "xattr", "zone=cisparc10", "sharezone=36", "dev=8ec004a"], "size"=>"5.52 GiB", "size_bytes"=>1632608256, "used"=>"39.52 MiB", "used_bytes"=>41435136}, "/var"=>{"available"=>"474.52 GiB", "available_bytes"=>-1588937216, "capacity"=>"0.03%", "device"=>"rpool/ROOT/zbe-0/var", "filesystem"=>"zfs", "options"=>["rw", "nodevices", "setuid", "nonbmand", "exec", "rstchown", "xattr", "atime", "mountpoint=/zones/cisparc10/root/var", "zone=cisparc10", "nozonemod", "sharezone=36", "dev=4950162"], "size"=>"474.66 GiB", "size_bytes"=>-1436724224, "used"=>"145.16 MiB", "used_bytes"=>152212992}, "/var/run"=>{"available"=>"5.48 GiB", "available_bytes"=>1591173120, "capacity"=>"0.01%", "device"=>"/etc/svc/volatile/", "filesystem"=>"lofs", "options"=>["rstchown", "zone=cisparc10", "sharezone=36", "dev=8ec0049"], "size"=>"5.48 GiB", "size_bytes"=>1591631872, "used"=>"448.00 KiB", "used_bytes"=>458752}}, "mtu_lo0"=>8232, "mtu_net0"=>1500, "netmask"=>"255.255.255.0", "netmask_lo0"=>"255.0.0.0", "netmask_net0"=>"255.255.255.0", "network"=>"10.32.77.0", "network_lo0"=>"127.0.0.0", "network_net0"=>"10.32.77.0", "networking"=>{"domain"=>"puppet.example", "fqdn"=>"solaris-10_u9-sparc-t4-64.puppet.example", "hostname"=>"solaris-10_u9-sparc-t4-64", "interfaces"=>{"lo0"=>{"bindings"=>[{"address"=>"127.0.0.1", "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}], "ip"=>"127.0.0.1", "mtu"=>8232, "netmask"=>"255.0.0.0", "network"=>"127.0.0.0"}, "net0"=>{"bindings"=>[{"address"=>"10.32.77.42", "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}], "ip"=>"10.32.77.42", "mac"=>"02:08:20:f1:97:4b", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0"}}, "ip"=>"10.32.77.42", "mac"=>"02:08:20:f1:97:4b", "mtu"=>1500, "netmask"=>"255.255.255.0", "network"=>"10.32.77.0", "primary"=>"net0"}, "operatingsystem"=>"Solaris", "operatingsystemmajrelease"=>"10", "operatingsystemrelease"=>"10_u9", "os"=>{"architecture"=>"sun4v", "family"=>"Solaris", "hardware"=>"sun4v", "name"=>"Solaris", "release"=>{"full"=>"10_u9", "major"=>"10", "minor"=>"9"}}, "osfamily"=>"Solaris", "path"=>"/usr/local/bin:/usr/local/sbin:/opt/csw/bin:PATH:/opt/puppetlabs/bin:/usr/local/bin:/usr/local/sbin:/opt/csw/bin:/usr/sbin:/usr/bin:/sbin", "pe_concat_basedir"=>"/opt/puppetlabs/puppet/cache/pe_concat", "physicalprocessorcount"=>1, "platform_symlink_writable"=>true, "platform_tag"=>"solaris-10-sparc", "processor0"=>"SPARC-T4", "processor1"=>"SPARC-T4", "processor10"=>"SPARC-T4", "processor11"=>"SPARC-T4", "processor12"=>"SPARC-T4", "processor13"=>"SPARC-T4", "processor14"=>"SPARC-T4", "processor15"=>"SPARC-T4", "processor16"=>"SPARC-T4", "processor17"=>"SPARC-T4", "processor18"=>"SPARC-T4", "processor19"=>"SPARC-T4", "processor2"=>"SPARC-T4", "processor20"=>"SPARC-T4", "processor21"=>"SPARC-T4", "processor22"=>"SPARC-T4", "processor23"=>"SPARC-T4", "processor24"=>"SPARC-T4", "processor25"=>"SPARC-T4", "processor26"=>"SPARC-T4", "processor27"=>"SPARC-T4", "processor28"=>"SPARC-T4", "processor29"=>"SPARC-T4", "processor3"=>"SPARC-T4", "processor30"=>"SPARC-T4", "processor31"=>"SPARC-T4", "processor32"=>"SPARC-T4", "processor33"=>"SPARC-T4", "processor34"=>"SPARC-T4", "processor35"=>"SPARC-T4", "processor36"=>"SPARC-T4", "processor37"=>"SPARC-T4", "processor38"=>"SPARC-T4", "processor39"=>"SPARC-T4", "processor4"=>"SPARC-T4", "processor40"=>"SPARC-T4", "processor41"=>"SPARC-T4", "processor42"=>"SPARC-T4", "processor43"=>"SPARC-T4", "processor44"=>"SPARC-T4", "processor45"=>"SPARC-T4", "processor46"=>"SPARC-T4", "processor47"=>"SPARC-T4", "processor48"=>"SPARC-T4", "processor49"=>"SPARC-T4", "processor5"=>"SPARC-T4", "processor50"=>"SPARC-T4", "processor51"=>"SPARC-T4", "processor52"=>"SPARC-T4", "processor53"=>"SPARC-T4", "processor54"=>"SPARC-T4", "processor55"=>"SPARC-T4", "processor56"=>"SPARC-T4", "processor57"=>"SPARC-T4", "processor58"=>"SPARC-T4", "processor59"=>"SPARC-T4", "processor6"=>"SPARC-T4", "processor60"=>"SPARC-T4", "processor61"=>"SPARC-T4", "processor62"=>"SPARC-T4", "processor63"=>"SPARC-T4", "processor7"=>"  SPARC-T4", "processor8"=>"SPARC-T4", "processor9"=>"SPARC-T4", "processorcount"=>64, "processors"=>{"count"=>64, "isa"=>"sparc", "models"=>["SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4", "SPARC-T4"], "physicalcount"=>1, "speed"=>"2.85 GHz"}, "puppet_files_dir_present"=>false, "puppetversion"=>"4.4.2", "ruby"=>{"platform"=>"sparc-solaris2.10", "sitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "version"=>"2.1.8"}, "rubyplatform"=>"sparc-solaris2.10", "rubysitedir"=>"/opt/puppetlabs/puppet/lib/ruby/site_ruby/2.1.0", "rubyversion"=>"2.1.8", "solaris_zones"=>{"current"=>"solaris-10_u9-sparc-t4-64", "zones"=>{"solaris-10_u9-sparc-t4-64"=>{"brand"=>"solaris10", "id"=>"36", "ip_type"=>"excl", "path"=>"/", "status"=>"running"}}}, "ssh"=>{"dsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 2 1 c9a8316e12052c89f9c8eea38c433c50950d5798", "sha256"=>"SSHFP 2 2 26773f31bd38b64224ee474eec7659dc05f23f8cb43e8352c1b58545bf5bbb15"}, "key"=>"AAAAB3NzaC1kc3MAAACBAIBt3ynjIBp7/uKbi9RdcO5DiIA0l7y4BmHsfm9042jYtMvIZkMF9cqwvxHjgoHW9JZGGNgIxUK/q0vjuGzctspVUovGBfL+m7F9Lp0rAHZVRkRm1wzGtjCPcdq35J9uVVj0YiHKvuuRvpooVtF55fe9ZfvwPBW41n9+eCX+yjY9AAAAFQC79jdm/KtE/8yXT6r1dMs63sF70wAAAIBC1yGHJcpRJt5NPi0t+eFQu6sDxxUeaaChW4u8BFLT4NXQ6SgBGW7FpT/zEaYEn2UZeQ8Mk3jAycUckyq5qSmWpunTHWdz8iKuuzPSyMgAYXwv0nGL+soRwGcjFdHIhCi2LGloN8JZpE/Kz2ry7yThwL7qMq3i8FFlovWDesAyzAAAAIATGYMDBcEnIY8+CvG3qFtsX4oM//ExuislYawqmChhp7A8IaMLeBoXmc3AdvvuZ/7CS/Kq/XwJApIPy9apRtqJp5zG5R9TvqEmCtCqtemvAmT0n9WsvDWev4YCIWj9wMiRlmT7HemL+5qFiKOmvo9lTd4NPRL3+gIPHCqXHyxacg=="}, "rsa"=>{"fingerprints"=>{"sha1"=>"SSHFP 1 1 ea3ecdaaf4d5112fe3148cb52385f928a3cc53f4", "sha256"=>"SSHFP 1 2 961dddd0fb580a5c0d1db74c16560fa37529cf4d162c13de99a880b1e91fd424"}, "key"=>"AAAAB3NzaC1yc2EAAAABIwAAAIEAz60kx84oy4edq6Nt2/SMQfQVVXoic/64JQ45EnwGKlMYvU3Okp3pT7uqyl+I5mXFjTB7wzLfIxzK5beofKDUbXNM5BwVeFQuZLR/hRusuvR5ntOce2kFMnyFteuvBue7Tg8YMGHAEM7fjfcqvuQgxWMELMJFwq0yUcl/aOL/o+U="}}, "sshdsakey"=>"AAAAB3NzaC1kc3MAAACBAIBt3ynjIBp7/uKbi9RdcO5DiIA0l7y4BmHsfm9042jYtMvIZkMF9cqwvxHjgoHW9JZGGNgIxUK/q0vjuGzctspVUovGBfL+m7F9Lp0rAHZVRkRm1wzGtjCPcdq35J9uVVj0YiHKvuuRvpooVtF55fe9ZfvwPBW41n9+eCX+yjY9AAAAFQC79jdm/KtE/8yXT6r1dMs63sF70wAAAIBC1yGHJcpRJt5NPi0t+eFQu6sDxxUeaaChW4u8BFLT4NXQ6SgBGW7FpT/zEaYEn2UZeQ8Mk3jAycUckyq5qSmWpunTHWdz8iKuuzPSyMgAYXwv0nGL+soRwGcjFdHIhCi2LGloN8JZpE/Kz2ry7yThwL7qMq3i8FFlovWDesAyzAAAAIATGYMDBcEnIY8+CvG3qFtsX4oM//ExuislYawqmChhp7A8IaMLeBoXmc3AdvvuZ/7CS/Kq/XwJApIPy9apRtqJp5zG5R9TvqEmCtCqtemvAmT0n9WsvDWev4YCIWj9wMiRlmT7HemL+5qFiKOmvo9lTd4NPRL3+gIPHCqXHyxacg==", "sshfp_dsa"=>"SSHFP 2 1 c9a8316e12052c89f9c8eea38c433c50950d5798\nSSHFP 2 2 26773f31bd38b64224ee474eec7659dc05f23f8cb43e8352c1b58545bf5bbb15", "sshfp_rsa"=>"SSHFP 1 1 ea3ecdaaf4d5112fe3148cb52385f928a3cc53f4\nSSHFP 1 2 961dddd0fb580a5c0d1db74c16560fa37529cf4d162c13de99a880b1e91fd424", "sshrsakey"=>"AAAAB3NzaC1yc2EAAAABIwAAAIEAz60kx84oy4edq6Nt2/SMQfQVVXoic/64JQ45EnwGKlMYvU3Okp3pT7uqyl+I5mXFjTB7wzLfIxzK5beofKDUbXNM5BwVeFQuZLR/hRusuvR5ntOce2kFMnyFteuvBue7Tg8YMGHAEM7fjfcqvuQgxWMELMJFwq0yUcl/aOL/o+U=", "staging_http_get"=>"curl", "swapfree"=>"4.00 GiB", "swapfree_mb"=>4095.9921875, "swapsize"=>"4.00 GiB", "swapsize_mb"=>4095.9921875, "system_uptime"=>{"days"=>0, "hours"=>0, "seconds"=>1860, "uptime"=>"0:31 hours"}, "timezone"=>"PDT", "uptime"=>"0:31 hours", "uptime_days"=>0, "uptime_hours"=>0, "uptime_seconds"=>1860, "virtual"=>"zone", "zfs_featurenumbers"=>"1,2,3,4,5,6", "zfs_version"=>"6", "zone_cisparc10_brand"=>"solaris10", "zone_cisparc10_id"=>"36", "zone_cisparc10_iptype"=>"excl", "zone_cisparc10_name"=>"solaris-10_u9-sparc-t4-64", "zone_cisparc10_path"=>"/", "zone_cisparc10_status"=>"running", "zonename"=>"solaris-10_u9-sparc-t4-64", "zones"=>1, "zpool_featurenumbers"=>"1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35", "zpool_version"=>"35", "clientcert"=>"solaris-10_u9-sparc-t4-64.puppet.example", "clientversion"=>"4.4.2", "clientnoop"=>false}
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
$onceover_node  = 'solaris-10_u9-sparc-64'

# Begin user-specified pre_condition

# End user-specified pre_condition


END
    }

    it { should compile }
  end
end

