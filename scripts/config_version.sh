#!/bin/bash
if [ -e /opt/puppetlabs/server/pe_version ]
then 
  /opt/puppetlabs/puppet/bin/ruby $1/$2/scripts/config_version.rb $1 $2  
else
  /usr/bin/git --git-dir $1/$2/.git rev-parse HEAD
fi
