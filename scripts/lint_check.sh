#!/bin/bash

# Error out if there are any failures
set -e
set -o pipefail
set -u

# Notes
# xargs -P2 is used to run 2 parallel processes at once.  This speeds up
# performance on multi-core systems.

if [ -e /proc/cpuinfo ]; then
  cores=$(awk 'BEGIN { c = 0 }; $1 == "processor" { c++ }; END { print c }' /proc/cpuinfo)
else
  cores=2
fi

# Use Puppet Enterprise Ruby to check ruby and yaml files
export PATH="/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH"

# Localize Gems on a per-job basis to prevent conflicts
gem_home="$(gem env gempath | cut -d: -f1)"
# Trim off the leading part of $HOME
gem_suffix=${gem_home##*/.gem/}
# Set GEM_HOME to a job specific location
export GEM_HOME="${HOME}/jobs/${CI_JOB_NAME:-lint}/gem/${gem_suffix}"

# If we need to install a gem, do so into HOME
# e.g. /home/gitlab-runner/.gem/ruby/2.1.0
export PATH="${GEM_HOME}/bin:$PATH"

echo '######## BEGIN DEPENDENCY SETUP #########'

# Display the gem environment
gem env

if ! (which bundle 2>&1 >/dev/null); then
  gem install bundler --no-ri --no-rdoc
fi

# List the files changes from $BASEBRANCH on stdout
files_changed() {
  # File status flags:
  # M modified - File has been modified
  # C copy-edit - File has been copied and modified
  # R rename-edit - File has been renamed and modified
  # A added - File has been added
  # D deleted - File has been deleted
  # U unmerged - File has conflicts after a merge
  git diff --name-status "${BASEBRANCH:=production}" \
    | awk '$1 ~ /^[MCRA]$/' \
    | cut -f2-
}

# Install dependencies
bundle install

echo '######## END DEPENDENCY SETUP #########'
echo
echo
echo '######## BEGIN LINT CHECKS #########'
# Lint only the manifest files changed
files_changed \
  | awk '/manifests\/.*\.(pp)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  bundle exec puppet-lint

echo '######## END LINT CHECKS #########'

# vim:tabstop=2
# vim:shiftwidth=2
# vim:expandtab
