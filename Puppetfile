forge "http://forge.puppetlabs.com"

# Modules from the Puppet Forge
# Note the versions are all set to :latest but after you've 
# installed you should change them to the exact version you want
mod "puppetlabs/inifile", :latest
mod "puppetlabs/stdlib", :latest
mod "puppetlabs/concat", :latest
mod "puppetlabs/ntp", :latest
mod "saz/ssh", :latest
mod "puppetlabs/postgresql",  '4.5.0'
mod "puppet/stash",           '1.3.0'
mod "puppetlabs/java",        '1.4.1'

#An example of using a specific forge module version instead of latest
#Notice the addition of single quotes
#mod "puppetlabs/inifile", '1.3.0'

# Modules from Github using various references
# Further examples: https://github.com/puppetlabs/r10k/blob/master/doc/puppetfile.mkd#examples
# update the tag to the most current release when implementing
mod 'hiera',
  :git => 'https://github.com/hunner/puppet-hiera',
  :tag => '1.3.1'

mod 'gitlab',
  :git => 'https://github.com/vshn/puppet-gitlab',
  :ref => '00397b86dfb3487d9df768cbd3698d362132b5bf'

mod 'r10k',
  :git => 'https://github.com/acidprime/r10k',
  :tag => 'v3.1.1'

mod 'gms',
  :git    => 'https://github.com/npwalker/abrader-gms',
  :branch => 'gitlab_disable_ssl_verify_support'

mod 'pltraining-rbac',
  :git    => 'https://github.com/puppetlabs/pltraining-rbac',
  :ref    => '2f60e1789a721ce83f8df061e13f8bf81cd4e4ce'
