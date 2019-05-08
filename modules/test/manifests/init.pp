class test (

) {

  info('Hello')
  #class { 'test':
    #message => 1
  #}
  #fail('Hello world')


}
