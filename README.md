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

[GitLab](gitlab.md)

###Stash

Coming soon!

###Github

Coming soon!
