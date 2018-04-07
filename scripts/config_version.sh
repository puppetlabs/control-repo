#!/bin/sh

ruby=ruby
script="$1/$2/scripts/config_version.rb"

if [ -x /opt/puppetlabs/puppet/bin/ruby ]; then
  ruby=/opt/puppetlabs/puppet/bin/ruby
fi

if [ -e $1/$2/.r10k-deploy.json ]; then
  script="$1/$2/scripts/code_manager_config_version.rb"
fi

"${ruby}" "${script}" "$1" "$2"
