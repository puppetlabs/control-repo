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
  }
  
  ##BEGIN - r10k webhook support
  include r10k::mcollective

  include r10k::webhook::config

  class {'r10k::webhook':
    user    => 'root',
    group   => '0',
    require => Class['r10k::webhook::config'],
  }
  ##END - r10k webhook support

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

}
