#!/opt/puppetlabs/puppet/bin/ruby

require 'json'

param_environment_path = ARGV[0]
param_environment      = ARGV[1]

if (param_environment_path && param_environment)
  # Use the parameters, if passed.
  environment_path = File.join(param_environment_path, param_environment)
else
  # Or use the parent directory.
  environment_path = File.dirname(File.expand_path(File.dirname(__FILE__)))
end

environment_r10k_deploy_file = File.join(environment_path, '.r10k-deploy.json')
environment_dot_git = File.join(environment_path, '.git')
pe_version_file = '/opt/puppetlabs/server/pe_version'
environment_version = nil

if (File.file?(environment_r10k_deploy_file))
  # Use the r10k deploy file, if using Code Manager.
  environment_version = JSON.parse(File.read(environment_r10k_deploy_file))['signature']

elsif (File.file?(pe_version_file))
  # Or use rugged, if using Puppet Enterprise.
  begin
    require 'rugged'
  rescue LoadError => e
    # It's okay.
  else
    environment_version = Rugged::Repository.discover(environment_path).head.target_id
  end

elsif (File.exist?(environment_dot_git))
  # Or use git, just use git.
  if (File.file?(environment_dot_git))
    # It's a file, created via --separate-git-dir.
    git_dir = File.read(environment_dot_git).split(': ')[1]
  else
    git_dir = environment_dot_git
  end
  git_rev_parse_head = %x( /usr/bin/git --git-dir #{git_dir} rev-parse HEAD 2>/dev/null )
  environment_version = git_rev_parse_head if ($?.exitstatus == 0)

end

# Return the version, if found, or the current timestamp.
puts (environment_version || Time.now.to_i)
