class profile::puppet::master {
  include ngrok
  ngrok::tunnel { 'webhook':
    proto => 'tcp',
    addr  => '8170',
  }
}
