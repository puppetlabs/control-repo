#!/bin/bash
if [ -e /opt/puppetlabs/server/pe_version ]
then 
  /opt/puppetlabs/puppet/bin/ruby $1/$2/scripts/config_version.rb $1 $2  
else
  /usr/bin/git --version > /dev/null 2>&1 &&
  /usr/bin/git --git-dir $1/$2/.git rev-parse HEAD ||
  date +%s
fi 
