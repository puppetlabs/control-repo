#!/usr/bin/env ruby
begin
  require 'rugged'
  require 'socket'
rescue LoadError => e
  t = Time.new
  puts t.to_i
else
  environmentpath = ARGV[0]
  environment     = ARGV[1]

  # Get the hostname of the Puppet master compiling the catalog.
  compiling_master = Socket.gethostname

  # Get the path to the environment being compiled.
  repo = Rugged::Repository.discover(File.join(environmentpath, environment))
  head = repo.head

  # First 12 characters of the sha1 hash of the newest commit.
  commit_id = head.target_id[0...11]

  # Show the compiling master, environment name, and commit ID.
  puts "#{compiling_master}-#{environment}-#{commit_id}"
end
