Table of Contents
=================

  * [Where Did All The Previous Code Go?](#where-did-all-the-previous-code-go)
  * [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
    * [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
      * [Gitlab](#gitlab)
      * [Stash](#stash)
      * [Github](#github)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)

# Where Did All The Previous Code Go?

Initially, the control-repo project began as a 'starter' template for anyone
who wanted to get started with R10k. As time passed (and Code Manager was
integrated into Puppet Enterprise), the scope of this project grew to include
opinionated Puppet profiles to setup many Puppet Enterprise components.  As the
code increased, so did the complexity of the control-repo project. To reduce
that complexity, as well as continue to meet the needs of individuals who would
like a more minimal template, this repository was stripped of anything other
than the bare minimum files necessary to get started with a functioning
control-repo.  All of the code that was previously in this repository still
exists in separate repositories under the [Puppet Labs RampUp Program namespace within Github](https://github.com/PuppetLabs-RampUpProgram)
and can easily be re-connected to an existing control-repo if that is required
(simply add the modules to the Puppetfile). Alternatively, if that
previously-opinoinated control-repo is desired, [it still exists on Github under the Puppet Labs RampUp Program namespace.](https://github.com/PuppetLabs-RampUpProgram/control-repo)
This control-repo project will remain a template for anyone who would like a minimal
'starter' template.

# What You Get From This control-repo

This repository exists as a template control-repo that can be used with R10k or Puppet Enterprise Code Manager.

The major points are:
 - An environment.conf that correctly implements:
   - A site directory for roles, profiles, and any custom modules for your organization
   - A config_version script
 - Provided config_version scripts to output the commit of code that your agent just applied
 - Basic example of roles/profiles code
 - Example hieradata directory with pre-created common.yaml and nodes directory
   - These match the default hierarchy that ships with PE

##Copy This Repo Into Your Own Git Server

###Gitlab

1. Install Gitlab
 - https://about.gitlab.com/downloads/

2. After Gitlab is installed you may sign if with the `root` user and password `5iveL!fe`

3. Make a user for yourself

4. Make an ssh key to link with your user.  You’ll want to do this on the machine you intend to edit code from ( most likely not your puppet master but your local workstation / laptop )
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/

5. Create a group called `puppet` ( this is case sensitive )
 - http://doc.gitlab.com/ce/workflow/groups.html

6. Add your user to the `puppet` group as well

7. Create a project called `control-repo` and set the Namespace to be the `puppet` group

8. Clone this control repository to your laptop/workstation
 - `git clone <repository url>`
 - `cd control-repo`

9. Remove this repository as the origin remote
 - `git remote remove origin`

10. Add your internal repository as the origin remote
 - `git remote add origin <url of your gitlab repository>`

11. Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

###Stash

Coming soon!

###Github

Coming soon!
