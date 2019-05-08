class test (

) {

  class { 'test::test':
    message => 1
  }
  #fail('Hello world')


}
