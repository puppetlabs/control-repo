# A Puppet Control Repository

* [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
* [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
  * [GitLab](#gitlab)
  * [Bitbucket/Stash](#bitbucketstash)
  * [Github](#github)
* [Code Manager Setup](#code-manager-setup)


## What You Get From This control-repo

This is a template [control repository](https://puppet.com/docs/pe/latest/code_management/control_repo.html) that has the minimum amount of scaffolding to make it easy to get started with [r10k](https://puppet.com/docs/pe/latest/code_management/r10k.html) or Puppet Enterprise's [Code Manager](https://puppet.com/docs/pe/latest/code_management/code_mgr.html).

The important files and items in this template are as follows:

* Basic example of roles and profiles.
* An example Puppetfile with various module references.
* An example Hiera configuration file and data directory with pre-created common.yaml and nodes directory.
  * These match the default hierarchy that ships with PE.
* An [environment.conf](https://puppet.com/docs/puppet/5.3/config_file_environment.html) that correctly implements:
  * A site-modules directory for roles, profiles, and any custom modules for your organization.
  * A config\_version script.
* An example [config\_version](https://puppet.com/docs/puppet/5.3/config_file_environment.html#configversion) script that outputs the git commit ID of the code that was used during a Puppet run.

Here's a visual representation of the structure of this repository:

```
control-repo/
├── data/                                 # Hiera data directory.
│   ├── nodes/                            # Node-specific data goes here.
│   └── common.yaml                       # Common data goes here.
├── manifests/
│   └── site.pp                           # The "main" manifest that contains a default node definition.
├── scripts/
│   ├── code_manager_config_version.rb    # A config_version script for Code Manager.
│   ├── config_version.rb                 # A config_version script for r10k.
│   └── config_version.sh                 # A wrapper that chooses the appropriate config_version script.
├── site-modules/                         # This directory contains site-specific modules and is added to $modulepath.
│   ├── profile/                          # The profile module.
│   └── role/                             # The role module.
├── LICENSE
├── Puppetfile                            # A list of external Puppet modules to deploy with an environment.
├── README.md
├── environment.conf                      # Environment-specific settings. Configures the modulepath and config_version.
└── hiera.yaml                            # Hiera's configuration file. The Hiera hierarchy is defined here.
```

## Copy This Repo Into Your Own Git Server

To get started with using the control-repo template in your own environment and git server, we've provided steps for the three most common servers we see: [GitLab](#gitlab), [BitBucket](#bitbucketstash), and [GitHub](#github).

### GitLab

1. Install GitLab.
    * <https://about.gitlab.com/downloads/>
1. After GitLab is installed you may sign in with the `root` user and password `5iveL!fe`.
1. Make a user for yourself.
1. Make an SSH key to link with your user. You’ll want to do this on the machine you intend to edit code from (most likely not your Puppet master, but your local workstation or laptop).
    * <http://doc.gitlab.com/ce/ssh/README.html>
    * <https://help.github.com/articles/generating-ssh-keys/>
1. Create a group called `puppet` (this is case sensitive).
    * <http://doc.gitlab.com/ce/workflow/groups.html>
1. Add your user to the `puppet` group as well.
1. Create a project called `control-repo`, and set the Namespace to be the `puppet` group.
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your gitlab repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

### Bitbucket/Stash

1. Install Bitbucket
    * <https://www.atlassian.com/software/bitbucket/download>
1. Make a `Project` called `puppet` (with a short name of `PUP`)
1. Create a repository called `control-repo`
1. Create a user called `r10k` with a password of `puppet`.
    * Make the r10k user an admin of the `PUP` project.
1. Either use the admin user to test pushing code, or create a user for yourself and add your SSH key to that user.
    * If making a user for yourself, give your user account read/write or admin privilege to the `PUP` project.
1. Clone this control repository to your laptop/workstation
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote
    * `git remote remove origin`
1. Add your internal repository as the origin remote
    * `git remote add origin <url of your bitbucket repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

### GitHub

1. Prepare your local git client to authenticate with GitHub.com or a local GitHub Enterprise instance.
    * <https://help.github.com/articles/generating-ssh-keys/>
    * <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>
1. Create a repository called `control-repo` in your user account or organization. Ensure that "Initialize this repository with a README" is not selected.
    * <https://help.github.com/articles/creating-a-new-repository/>
1. Make a note of your repository URL (HTTPS or SSH, depending on your security configuration).
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your github repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

## Code Manager Setup

If you use Puppet Enterprise and have not yet enabled and configured Code Manager, in addition to reading the official [documentation](https://puppet.com/docs/pe/latest/code_mgr.html) for enabling it, you may want to look at the Ramp-Up Program's control repository instead of this one. It's similar to this repo except that it has batteries included, so to speak. There are pre-built profiles for configuring Code Manager, generating SSH keys, and setting up your Git server to work with Code Manager.

* <https://github.com/Puppet-RampUpProgram/control-repo>
