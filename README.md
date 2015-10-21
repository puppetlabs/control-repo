# Before Starting: 

This control repo and the steps below are intended to be used during a new installation of PE.  

If you intend to use it on an existing installation of PE then you'll have to figure out some of the steps on your own and be warned that if you've already written or downloaded modules when you start using r10k it will remove all of the existing modules and replace them with what you define in your Puppetfile.  Please copy or move your existing modules to another directory to ensure you do not lose any work you've already started.  

## Setup a Trusted Fact On Your PE Master

This control repository is setup to manage certain portions of your PE installation for you if you create a trusted fact called `pp_role`.  In order to do so, lay down a file that looks exactly like the below in `/etc/puppetlabs/puppet/csr_attributes.yaml`

```
---
extension_requests:
  #pp_role
  1.3.6.1.4.1.34380.1.1.13: 'all_in_one_pe'
```

### If You Have Not Installed PE 

Good then you can proceed forward and the trusted fact will be used when you get to the install step. 

### If You Have Already Installed PE

Trusted facts are created at the time a CSR is generated.  So, we need to regenerate the certificate on the master for the above trusted fact to be created.  

Follow this document to regenerate the certificate on your master.  

http://docs.puppetlabs.com/pe/latest/regenerate_certs_master.html

##Copy This Repo Into Your Own Git Server

###Gitlab

1. Install Gitlab
 - https://about.gitlab.com/downloads/

2. After Gitlab is installed you may sign if with the `root` user and password `5iveL!fe`

3. Make an user for yourself

4.  Make an ssh key to link with your user.  You’ll want to do this on the machine you intend to edit code from ( most likely not your puppet master but your local workstation / laptop )
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/

5.  Create a group called `puppet` ( this is case sensitive )
 - http://doc.gitlab.com/ce/workflow/groups.html

6. Create a user called `r10k_api_user` and add them to the `puppet` group
 - From the landing page, select groups
 - Choose the puppet group
 - In the left hand pane, select memembers
 - Add the `r10k_api_user` with `master` permissions

7. Add your user to the `puppet` group as well 

7. Create a project called `control-repo` and set the Namespace to be the `puppet` group

8.  Logout of root and login as the `r10k_api_user` 
 - Go to profile settings -> account ( https://<your_gitlab_server>/profile/account )
 - Copy the api token
	
9. Clone this control repository to your laptop/workstation 
 - `git clone https://github.com/npwalker/control-repo.git`
 - `cd control-repo`

10. `git mv hieradata/nodes/example-puppet-master.yaml hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`
 - Open `hieradata/nodes/<fqdn_of_your_puppet_master>.yaml` 
     - edit `gms_api_token` to be your api token
     - edit `git_management_system` to be 'gitlab'
     - edit the `gms_server_url`

11. `git add hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`

11. `git commit -m "renaming example-puppet-master.yaml"`

11. Rename my repository as the upstream remote
 - `git remote rename origin upstream`

12. Add your internal repository as the origin remote
 - `git remote add origin <url of your repository from step 4>`

13. `git branch --set-upstream-to origin/production`

13.  Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

###Stash

###Github

###The General Idea - Not Specific to GMS 

1. Make an user in your internal git server for yourself

2. Make an ssh key to link with your user. You’ll want to do this on the machine you intend to edit code from ( most likely not your puppet master but your local workstation / laptop )

 - https://help.github.com/articles/generating-ssh-keys/

3. Create a group or organization called "puppet"

4. Create a repository in your git server called control-repo

4. Clone this control repository to your laptop/workstation 
 - `git clone https://github.com/npwalker/control-repo.git`
 - `cd control-repo`

5. Rename my repository as the upstream remote
 - `git remote rename origin upstream`

6. Add your internal repository as the origin remote
 - `git remote add origin <url of your repository from step 4>`

7.  Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

8. Find the url to your internal repo.  This is usually on the front page of the repo

9. Add the repo as a remote
 - git remote add origin git@your-git-server:puppet/control-repo.git

10. Push the repository from your machine up to your git server

 - git push origin production

##Configure PE to Use the Control-Repo

###Install PE

1. Download the latest version of the PE installer for your platform and copy it to your master
 - https://puppetlabs.com/download-puppet-enterprise 
2. Expand the tarball and `cd` into the directory
3. Run `puppet-enterprise-installer` to install

If you run into any issues or have more questions about the installer you can see our docs here:

http://docs.puppetlabs.com/pe/latest/install_basic.html

##Get the Control-Repo Deployed On Your Master

At this point you have my control-repo code deployed into your git server.  However, we have one final challenge getting that code onto your puppet master.  In the end state the master will pull code from the git server via r10k, however, at this moment your puppet master doesn't have credentials to get code from the git server.  

So, we'll set up a deploy key in the git server that will allow a ssh-key we make to deploy the code and configure everything else.  

1. On your puppet master, make an ssh key for r10k to connect to gitlab
 - `/usr/bin/ssh-keygen -t rsa -b 2048 -C 'r10k' -f /root/.ssh/r10k_rsa -q -N ''`
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/
2. Create a deploy key on the `control-repo` project in Gitlab
 - paste in the public key from above
3. Follow https://docs.puppetlabs.com/pe/latest/r10k_config_console.html
 - The remote is on the front page of the project in the gitlab UI
 - git_settings should be:
 - `{"provider": "rugged",
    "private_key": "/root/.ssh/r10k_rsa"}`
3. Run `puppet agent -t` 
 - Expect to see changes to `r10k.yaml`
3. Run `r10k deploy environment -pv`
4. Run `puppet agent -t` 

### Update Your Existing Install To Point To The Control Repository

https://docs.puppetlabs.com/pe/latest/r10k_config_console.html

## Run r10k

1.  Run `r10k deploy environment -pv` and watch it install the modules from your Puppetfile


----
#Miscellaneous

## If You Want to Install Pointing To This Repo on Github

### Setting Up Gitlab 

1.  Install Gitlab on a server by specifying the following trusted fact on the soon-to-be Gitlab server and then [install the PE agent](http://docs.puppetlabs.com/pe/latest/install_agents.html#using-the-puppet-agent-package-installation-script). 

   ```
   ---
   extension_requests:
      #pp_role
      1.3.6.1.4.1.34380.1.1.13: 'gitlab'
   ```

### Setting up Github

Not yet completed. 

### Setting up Stash

Not yet completed.


#TODO
Flush out generating an answer file and then appending extra answers onto the end of it.  



