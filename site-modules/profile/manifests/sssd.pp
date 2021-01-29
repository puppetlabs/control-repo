# Configure SSSD for use with LDAP and Kerberos
#
# @summary Configure SSSD for use with LDAP and Kerberos
# Requires ncsa/sssd and bodgit/sssd as dependancy. 
#
# @example
#   include profile::sssd
class profile::sssd (
    # PARAMETERS: general
    Boolean       $enablemkhomedir,
    Array[String] $authconfig_pkgs,
    #String        $cacert-content,
    #String        $cacert-file-path,

) {

    # INSTALL INCOMMON ROOT CA
    # TODO - make this a paramter, then use a hiera interpolation lookup in hiera
    #file { ${cacert-file-path} :
    #    content => "${cacert-content}",
    #    mode   => '0444',
    #    before => Service['sssd'],
    #}

    include ::sssd

    # ENABLE MKHOMEDIR (create homedir on first login)
    ensure_packages( $authconfig_pkgs )
    # create appropriate args
    if $enablemkhomedir {
        $authconfig_args = ['--enablemkhomedir', '--enablesssd', '--enablesssdauth']
    }
    else {
        $authconfig_args = ['--disablemkhomedir', '--enablesssd', '--enablesssdauth']
    }
    $authconfig_args_f = join($authconfig_args, ' ')
    # run authconfig
    exec { 'enablesssdauth':
        path    => '/bin/:/sbin/:/usr/bin/:/usr/sbin/',
        onlyif  => 'test `grep -i "SSSD" /etc/sysconfig/authconfig | grep "=yes" | wc -l` -lt 2',
        command => "authconfig ${authconfig_args_f} --updateall", # should we just be using '--update'?
    }

    # ENSURE SSSD SERVICE IS RESTARTED IF/WHEN ANY KRB5 CFG FILES CHANGE
#    $krb_cfgfile_data = lookup( 'system_authnz::kerberos::cfg_file_settings',
#                                Hash,
#                                'hash' )
#    # setup a "notify" relationship from filename to service
#    $krb_cfgfile_data.each() | $filename, $junk | {
#        File[ $filename ] ~> Class[ '::sssd::service' ]
#    }

}

