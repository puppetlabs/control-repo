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
export PATH="/opt/puppetlabs/puppet/bin:$PATH"

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

# Check the Puppetfile
echo -n "Checking Puppetfile ... "
ruby -c Puppetfile

files_changed \
  | awk '/\.(sh)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  bash -n

# Check all YAML files
# See: http://stackoverflow.com/questions/3971822/yaml-syntax-validator
files_changed \
  | awk '/\.(yml|yaml)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  ruby -r yaml -e 'YAML.load_file(ARGV[0])'

# Check all JSON files
files_changed \
  | awk '/\.(json)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  ruby -r json -e 'JSON.load(File.read(ARGV[0]))'

files_changed \
  | awk '/\.(rb)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  ruby -c

# Check all erb files
files_changed \
  | awk '/\.(erb)$/' \
  | xargs -l --no-run-if-empty -t -P$cores -n1 \
  bash -c 'erb -P -x -T- $0 | ruby -c'

# Check all Puppet manifest files
files_changed \
  | awk '/manifests\/.*\.(pp)$/' \
  | xargs --no-run-if-empty -t -P$cores -n1 \
  puppet parser validate

# vim:tabstop=2
# vim:shiftwidth=2
# vim:expandtab
