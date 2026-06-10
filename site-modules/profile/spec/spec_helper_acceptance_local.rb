# frozen_string_literal: true

require 'singleton'

class Helper
  include Singleton
  include PuppetLitmus
end

# Where the hiera config file is located
def hiera_config
  '/etc/puppet/hiera.yaml'
end

# Uploads hiera fixtures
def upload_hiera_files
  Dir.glob('spec/fixtures/hiera/**/*.yaml').each do |file|
    Helper.instance.bolt_upload_file(file, "/etc/puppet/#{file.delete_prefix('spec/fixtures/hiera/')}")
  end
end
