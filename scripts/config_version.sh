#!/bin/sh

if [ $# -ne 2 -o ! -d "$1" -o ! -d "$1/$2" ]; then
  echo "usage: $0 <environmentpath> <environment>" >&2
  exit 1
fi

ruby=ruby
script="$1/$2/scripts/config_version.rb"

if [ -x /opt/puppetlabs/puppet/bin/ruby ]; then
  ruby=/opt/puppetlabs/puppet/bin/ruby
fi

if [ -e $1/$2/.r10k-deploy.json ]; then
  script="$1/$2/scripts/code_manager_config_version.rb"
fi

"${ruby}" "${script}" "$1" "$2"
