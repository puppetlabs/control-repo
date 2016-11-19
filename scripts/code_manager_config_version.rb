#!/usr/bin/env ruby
require 'json'

environmentpath = ARGV[0]
environment     = ARGV[1]

r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

#output the sha1 from the control-repo
puts JSON.parse(File.read(r10k_deploy_file_path))['signature']
