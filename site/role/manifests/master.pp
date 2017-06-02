class role::master {
  # Here we include all of the profiles taht make up a Puppet Master
  # for now it's just the base (the SOE) but we will probably add more later
  include profile::base
}
