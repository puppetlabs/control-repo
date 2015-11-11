require 'puppet/util/puppetdb'

module Puppet::Parser::Functions
  newfunction(:puppetdb_hostnames, :type => :rvalue) do |args|
    output = []
    Puppet::Util::Puppetdb.config.server_urls.each do | server_url |
      output << server_url.hostname
    end

    output
  end
end
