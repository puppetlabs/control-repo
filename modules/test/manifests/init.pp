class test (

) {

  class { 'test::test':
    message => 'Hello'
  }
  #fail('Hello world')


}
