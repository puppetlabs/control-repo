#!/opt/puppetlabs/puppet/bin/ruby
begin
  require 'rugged'
  require 'socket'
rescue LoadError
  t = Time.new
  puts t.to_i
else
  environmentpath = ARGV[0]
  environment     = ARGV[1]

  # Get the hostname of the Puppet master compiling the catalog.
  # Sometimes the hostname is the fqdn, so we'll take the first segment.
  compiling_master = Socket.gethostname.split('.').first

  # Get the path to the environment being compiled.
  repo = Rugged::Repository.discover(File.join(environmentpath, environment))
  head = repo.head

  # First 12 characters of the sha1 hash of the newest commit.
  commit_id = head.target_id[0...11]

  # Show the compiling master, environment name, and commit ID.
  puts "#{compiling_master}-#{environment}-#{commit_id}"
end
