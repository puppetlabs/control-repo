# Before Starting: 

This control repo and the steps below are intended to be used during a new installation of PE.  

If you intend to use it on an existing installation of PE then you'll have to figure out some of the steps on your own and be warned that if you've already written or downloaded modules when you start using r10k it will remove all of the existing modules and replace them with what you define in your Puppetfile.  Please copy or move your existing modules to another directory to ensure you do not lose any work you've already started.  

## How to Copy This Repo Into Your Own Git Server

1.  Make an user in your internal git server

2.  Make an ssh key to link with your user.  You’ll want to do this on the machine you intend to edit code from ( most likely not your puppet master but your local workstation / laptop )
 - https://help.github.com/articles/generating-ssh-keys/

3. Create a repository in your git server called control-repo

4. Setup your control repository by copying this one
 - https://github.com/npwalker/control-repo
 - git clone https://github.com/npwalker/control-repo.git

5. Remove the .git directory from the cloned repo.
 - `cd control-repo`
 - `rm -rf .git`

6.  `git init` 

7.  Find the url to your internal repo this is usually on the front page of the repo
 - Add the repo as a remote
 - git remote add origin git@gitlab-server:root/control-repo.git

8.  Push the repository from your machine up to your git server
 - `git push origin production`

## Lay Down a Trusted Fact Before Installing PE

This control repository is setup to manage certain portions of your PE installation for you if you lay down a trusted fact called pp_role before installing.  In order to immeadiately gain from these benefits you will need to lay down a file that looks exactly like the below in `/etc/puppetlabs/puppet/csr_attributes.yaml`

```
---
extension_requests:
  #pp_role
  1.3.6.1.4.1.34380.1.1.13: 'all_in_one_pe'
```

## Install a New PE 2015.2+ Instance or Update an Existing PE Instance To Use the Control Repository

### Install PE Specifying Answers To Point To Your Control Repository 

https://docs.puppetlabs.com/pe/latest/r10k_config_answers.html

#TODO
Flush out generating an answer file and then appending these answers onto the end of it.  

### Update Existing PE 2015.2+ Install To Point To The Control Repository

https://docs.puppetlabs.com/pe/latest/r10k_config_console.html

## Run r10k

1.  Run `r10k deploy environment —verbose` and watch it install the modules from your Puppetfile


