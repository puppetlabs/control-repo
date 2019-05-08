class test (
  String $hostname = $facts['hostname'],
) {

  info($hostname)
  #class { 'test':
    #message => 1
  #}
  #fail('Hello world')


}
