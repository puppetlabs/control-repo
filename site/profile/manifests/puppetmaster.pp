class profile::puppetmaster {

  class { 'hiera':
    hierarchy  => [
      'virtual/%{::virtual}',
      'nodes/%{::trusted.certname}',
      'common',
    ],
    hiera_yaml => '/etc/puppetlabs/code/hiera.yaml',
    datadir    => '/etc/puppetlabs/code/environments/%{environment}/hieradata',
    owner      => 'root',
    group      => 'root',
    notify     => Service['pe-puppetserver'],
  }

  #BEGIN - Generate an SSH key for r10k to connect to git
  $r10k_ssh_key_file = '/root/.ssh/r10k_rsa'
  exec { 'create r10k ssh key' :
    command => "/usr/bin/ssh-keygen -t rsa -b 2048 -C 'r10k' -f ${r10k_ssh_key_file} -q -N ''",
    creates => $r10k_ssh_key_file,
  }
  #END - Generate an SSH key for r10k to connect to git  
 
  #BEGIN - Add deploy key and webook to git management system
  $git_management_system = hiera('git_management_system', '')

  if $git_management_system in ['gitlab', 'github'] {
   
    git_deploy_key { "add_deploy_key_to_puppet_control-${fqdn}":
      ensure       => present,
      name         => $::fqdn,
      path         => "${r10k_ssh_key_file}.pub",
      token        => hiera('gms_api_token'),
      project_name => 'puppet/control-repo',
      server_url   => hiera('gms_server_url'),
      provider     => $git_management_system,
    }
  
    git_webhook { 'web_post_receive_webhook' :
      ensure       => present,
      webhook_url  => "http://${fqdn}:8088/payload",
      token        => hiera('gms_api_token'),
      project_name => 'puppet/control-repo',
      server_url   => hiera('gms_server_url'),
      provider     => $git_management_system,
    }

  }
  #END - Add deploy key and webhook to git management system

  #Lay down update-classes.sh for use in r10k postrun_command
  #This is configured via the pe_r10k::postrun key in hiera
  file { '/usr/local/bin/update-classes.sh' :
    ensure => file,
    source => 'puppet:///modules/profile/puppetmaster/update-classes.sh',
    mode   => '755',
  }

  #https://docs.puppetlabs.com/puppet/latest/reference/config_file_environment.html#environmenttimeout
  ini_setting { "environment_timeout = unlimited":
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'environment_timeout',
    value   => 'unlimited',
  }

}
