Table of Contents
=================

* [Before Starting](#before-starting)
* [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
* [How To Set It All Up](#how-to-set-it-all-up)
  * [Setup a Trusted Fact On Your PE Master](#setup-a-trusted-fact-on-your-pe-master)
    * [If You Have Not Installed PE](#if-you-have-not-installed-pe)
    * [If You Have Already Installed PE](#if-you-have-already-installed-pe)
  * [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
    * [Gitlab](#gitlab)
    * [Stash](#stash)
    * [Github](#github)
  * [Configure PE to Use the Control\-Repo](#configure-pe-to-use-the-control-repo)
    * [Install PE](#install-pe)
    * [Get the Control\-Repo Deployed On Your Master](#get-the-control-repo-deployed-on-your-master)
  * [Test Code Manager](#test-code-manager)
* [Updating From a Previous Version of PE](#updating-from-a-previous-version-of-pe)
  * [Upgrading to PE2015\.3\.z from PE 2015\.2\.z](#upgrading-to-pe20153z-from-pe-20152z)
* [Appendix](#appendix)
  * [Test The Zack/r10k Webhook](#test-the-zackr10k-webhook)

# Before Starting

This control repo and the steps below are intended to be used during a new installation of PE.

The instructions are geared towards a new installation of PE2015.3.z.  However, the control-repo should work just fine on [PE2015.2.z](#upgrading-to-pe20153z-from-pe-20152z)

If you intend to use this control-repo on an existing installation then be warned that if you've already written or downloaded modules when you start using r10k it will remove all of the existing modules and replace them with what you define in your Puppetfile.  Please copy or move your existing modules to another directory to ensure you do not lose any work you've already started.

# What You Get From This control-repo

As a result of following the instructions below you will receive at least the beginning of a best-practices installation of PE including...

 - A git server
 - The ability to push code to your git server and have it automatically deployed to your PE Master
 - A config_version script to output the commit of code that your agent just applied
 - Optimal tuning of PE settings for this configuration
 - Working and example roles/profiles code

# How To Set It All Up

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

3. Make a user for yourself

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

8. Create a project called `control-repo` and set the Namespace to be the `puppet` group

9.  Logout of root and login as the `r10k_api_user`
 - Go to profile settings -> account ( https://<your_gitlab_server>/profile/account )
 - Copy the api token

10. Clone this control repository to your laptop/workstation
 - `git clone <repository url>`
 - `cd control-repo`

11. `git mv hieradata/nodes/example-puppet-master.yaml hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`
 - Open `hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`
     - edit `gms_api_token` to be your api token
     - edit `git_management_system` to be 'gitlab'
     - edit the `gms_server_url`

12. `git add hieradata/nodes/<fqdn_of_your_puppet_master>.yaml`

13. `git commit -m "renaming example-puppet-master.yaml"`

14. Rename my repository as the upstream remote
 - `git remote rename origin upstream`

15. Add your internal repository as the origin remote
 - `git remote add origin <url of your gitlab repository>`

16.  Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

17. `git branch --set-upstream-to origin/production`

###Stash

Coming soon!

###Github

Coming soon!

##Configure PE to Use the Control-Repo

###Install PE

1. Download the latest version of the PE installer for your platform and copy it to your master
 - https://puppetlabs.com/download-puppet-enterprise
2. Expand the tarball and `cd` into the directory
3. Run `puppet-enterprise-installer` to install

If you run into any issues or have more questions about the installer you can see our docs here:

http://docs.puppetlabs.com/pe/latest/install_basic.html

###Get the Control-Repo Deployed On Your Master

At this point you have our control-repo code deployed into your git server.  However, we have one final challenge: getting that code onto your puppet master.  In the end state the master will pull code from the git server via r10k, however, at this moment your puppet master doesn't have credentials to get code from the git server.

So, we'll set up a deploy key in the git server that will allow a ssh-key we make to deploy the code and configure everything else.

1. On your puppet master, make an ssh key for r10k to connect to gitlab
 - `/usr/bin/ssh-keygen -t rsa -b 2048 -C 'code_manager' -f /etc/puppetlabs/puppetserver/code_manager.key -q -N ''`
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/
2. Create a deploy key on the `control-repo` project in Gitlab
 - Paste in the public key from above
 - `cat /etc/puppetlabs/puppetserver/code_manager.key.pub`
3. Login to the PE console
7. Navigate to the Classification page
 - Click on the PE Master group
 - Click the Classes tab
 - Add the `puppet_enterprise::profile::master`
    - Set the `r10k_remote` to the ssh url from the front page of your gitlab repo
    - Set the `r10k_private_key` parameter to `/etc/puppetlabs/puppetserver/code_manager.key`
 - Commit your changes
8. Run `puppet agent -t`
 - Expect to see changes to `r10k.yaml`
9. Run `r10k deploy environment -pv`
10. Run `puppet agent -t`
 - Expect to see code manager enabled
10. `echo 'code_manager_mv_old_code=true' > /opt/puppetlabs/facter/facts.d/code_manager_mv_old_code.txt`
11. Run `puppet agent -t`
 - Now you should see many more changes
 - Your code has been deployed with code manager now

## Test Code Manager

One of the components setup by this control-repo is that when you "push" code to your git server, the git server will inform the puppet master to deploy branch you just pushed.

1. In one terminal window, `tail -f /var/log/puppetlabs/puppetserver/puppetserver.log`
2. In a second terminal window
 - Add a new file, `touch test_file`
 - `git add test_file`
 - `git commit -m "adding a test_file"`
 - `git push origin production`
3. Allow the push to complete and then wait a few seconds for everything to sync over
 - `ls -l /etc/puppetlabs/code/environments/production`
    - Confirm test_file is present
4. In your first terminal window review the `puppetserver.log` to see the type of logging each sync will create

----
# Updating From a Previous Version of PE

## Upgrading to PE2015.3.z from PE 2015.2.z

Remove `pe_r10k` from the PE master group in the console and instead add the following two parameters to the `puppet_enterprise::profile::master` class under the PE master group.

- `r10k_remote` = the ssh url for your internal repo
- `r10k_private_key` = `/etc/puppetlabs/puppetserver/code_manager.key`

When upgrading the `puppet_enterprise::profile::master` class has the `file_sync_enabled` parameter set to `false`.  This parameter should be removed so that code manager can configure file sync.

Finally, you’ll need to `echo 'code_manager_mv_old_code=true' > /opt/puppetlabs/facter/facts.d/code_manager_mv_old_code.txt` so that my puppet code will redeploy all of your code with code manager.

# Appendix

## Test The Zack/r10k Webhook

If you are using PE2015.2.z or if you've forced the use of the zack/r10k webhook then you'll want to test that it works.

One of the components setup by this control-repo is that when you "push" code to your git server, the git server will inform the puppet master to run `r10k deploy environment -p`.

1. Edit README.md
 - Just add something to it
2. `git add README.md`
3. `git commit -m "edit README"`
4. `git push origin production`
5. Allow the push to complete and then give it few seconds to complete
 - Open `/etc/puppetlabs/code/environments/production/README.md` and confirm your change is present
