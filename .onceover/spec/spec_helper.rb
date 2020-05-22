RSpec.configure do |c|
  c.mock_with :rspec
end

require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec_junit_formatter'
require 'onceover/rspec/formatters'

RSpec.configure do |c|
  # Create onceover settings to be accessed by formatters
  c.add_setting :onceover_tempdir
  c.add_setting :onceover_root
  c.add_setting :onceover_environmentpath

  c.onceover_tempdir         = "/Users/christopher.lawrence/projects/control-repo/.onceover"
  c.onceover_root            = "/Users/christopher.lawrence/projects/control-repo"
  c.onceover_environmentpath = "etc/puppetlabs/code/environments"

  # Also add JUnit output in case people want to use that
  c.add_formatter('RSpecJUnitFormatter','/Users/christopher.lawrence/projects/control-repo/.onceover/spec.xml')

  c.parser                = 'future'
  c.formatter             = 'OnceoverFormatter'
  c.trusted_server_facts  = true
  c.environmentpath       = '/Users/christopher.lawrence/projects/control-repo/.onceover/etc/puppetlabs/code/environments'
  c.module_path           = '/Users/christopher.lawrence/projects/control-repo/.onceover/etc/puppetlabs/code/environments/production/site-modules:/Users/christopher.lawrence/projects/control-repo/.onceover/etc/puppetlabs/code/environments/production/modules'

  c.hiera_config          = '/Users/christopher.lawrence/projects/control-repo/.onceover/etc/puppetlabs/code/environments/production/hiera.yaml'
  c.manifest              = ''
  ENV['STRICT_VARIABLES'] = 'no'
end
