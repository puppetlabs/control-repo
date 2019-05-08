class test (

) {

  info(facter['hostname'])
  #class { 'test':
    #message => 1
  #}
  #fail('Hello world')


}
