# Puppet Enterprise Starter Content Pack

## Introduction

This repository provides "batteries-included" starter Puppet content. It shows you how Puppet code is organized to make self-service provisioning easy and can create 5 different machine types out of the box:
- Linux base server
- Linux MySQL server
- Linux web server
- Windows base server
- Windows web server

## Install Starter Content on your PE Master

Installation with git
```
git clone https://github.com/maju6406/control-repo.git
cd puppet-starter_content
sudo bash scripts/nc_setup.sh
sudo /opt/puppetlabs/bin/puppet agent -t
```

Installation with curl
```
curl -sSL https://github.com/puppetlabs/control-repo/archive/production.tar.gz | tar -zx
cd control-repo-production
sudo bash scripts/nc_setup.sh
sudo /opt/puppetlabs/bin/puppet agent -t
```
