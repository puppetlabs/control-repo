node 'node1' {
  
  class { 'tomcat':
    xmx   => '129m',
    xms   => '69m',
    user  => 'tomcat',
    group => 'root',
  }
  include base
}


node default {
}

node 'node2' {
  include base
  include java::install
  class { 'tomcat':
    xmx   => '127m',
    xms   => '67m',
    user  => 'tomcat',
    group => 'root',
  }
}