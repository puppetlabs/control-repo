class profile::git_webhook::zack_r10k_webhook_disable {

  file { '/etc/webhook.yaml' :
    ensure => absent,
    notify => Exec['stop and disable webhook service'],
  }

  exec { 'stop and disable webhook service' :
    command     => '/opt/puppetlabs/puppet/bin/puppet resource service webhook ensure=stopped enable=false',
    logoutput   => true,
    refreshonly => true,
  }

}
