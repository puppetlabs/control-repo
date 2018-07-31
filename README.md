Table of Contents
=================

  * [Where Did All The Previous Code Go?](#where-did-all-the-previous-code-go)
  * [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
    * [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
      * [GitLab](#gitlab)
      * [Stash](#stash)
      * [GitHub](#github)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc.go)

# Where Did All The Previous Code Go?

Initially, the control-repo project began as a 'starter' template for anyone who wanted to get started with r10k. As time passed, and Code Manager was integrated into Puppet Enterprise, the scope of this project grew to include opinionated Puppet profiles to set up many Puppet Enterprise components. As the code increased, so did the complexity of the control-repo project. To reduce that complexity, as well as continuing to meet the needs of individuals who would like a more minimal template, this repository was stripped of anything other than the bare minimum files necessary to get started with a functioning
control-repo.

All of the code that was previously in this repository still exists in separate repositories under the [Puppet Ramp Up Program namespace within Github](https://github.com/Puppet-RampUpProgram) and can be re-connected to an existing control-repo if that is required by adding the modules to the Puppetfile. Alternatively, if that previously opinionated control-repo is desired, [it still exists on Github under the Puppet Ramp Up Program namespace.](https://github.com/Puppet-RampUpProgram/control-repo) This control-repo project will remain a template for anyone who would like a minimal 'starter' template.

# What You Get From This control-repo

This repository is a template control-repo that can be used with r10k or Puppet Enterprise Code Manager.

The major points are:
 - An environment.conf that correctly implements:
   - A site directory for roles, profiles, and any custom modules for your organization.
   - A config_version script.
 - Provided config_version scripts to output the commit of code that your agent just applied.
 - Basic example of roles/profiles code.
 - Example hieradata directory with pre-created common.yaml and nodes directory.
   - These match the default hierarchy that ships with PE.

## Copy This Repo Into Your Own Git Server

### GitLab

1. Install GitLab.
 - https://about.gitlab.com/downloads/

2. After GitLab is installed you may sign if with the `root` user and password `5iveL!fe`.

3. Make a user for yourself.

4. Make an SSH key to link with your user. You’ll want to do this on the machine you intend to edit code from (most likely not your Puppet master, but your local workstation or laptop).
 - http://doc.gitlab.com/ce/ssh/README.html
 - https://help.github.com/articles/generating-ssh-keys/

5. Create a group called `puppet` (this is case sensitive).
 - http://doc.gitlab.com/ce/workflow/groups.html

6. Add your user to the `puppet` group as well.

7. Create a project called `control-repo`, and set the Namespace to be the `puppet` group.

8. Clone this control repository to your laptop/workstation:
 - `git clone <repository url>`
 - `cd control-repo`

9. Remove this repository as the origin remote:
 - `git remote remove origin`

10. Add your internal repository as the origin remote:
 - `git remote add origin <url of your gitlab repository>`

11. Push the production branch of the repository from your machine up to your git server
 - `git push origin production`

### Stash

Coming soon!

### GitHub

1. Prepare your local git client to authenticate with GitHub.com or a local GitHub Enterprise instance.
  - https://help.github.com/articles/generating-ssh-keys/
  - https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/

2. Create a repository called `control-repo` in your user account or organization.  Ensure that "Initialize this repository with a README" is not selected.
  - https://help.github.com/articles/creating-a-new-repository/

3. Make a note of your repository URL (HTTPS or SSH, depending on your security configuration).

4. Clone this control repository to your laptop/workstation:
  - `git clone <repository url>`
  - `cd control-repo`

5. Remove this repository as the origin remote:
  - `git remote remove origin`

6. Add your internal repository as the origin remote:
  - `git remote add origin <url of your github repository>`

7. Push the production branch of the repository from your machine up to your git server
  - `git push origin production`
