#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'socket'

environmentpath = ARGV[0]
environment     = ARGV[1]

# Get the hostname of the Puppet master compiling the catalog.
# Sometimes the hostname is the fqdn, so we'll take the first segment.
compiling_master = Socket.gethostname.split('.').first

# Get the path to the Code Manager deployment info file.
r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

# Get the first 12 characters of the commit ID out of the deployment file.
commit_id = JSON.parse(File.read(r10k_deploy_file_path))['signature'][0...11]

# Show the compiling master, environment name, and commit ID.
puts "#{compiling_master}-#{environment}-#{commit_id}"
