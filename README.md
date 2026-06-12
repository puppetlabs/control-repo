# A Puppet Control Repository

* [What You Get From This control\-repo](#what-you-get-from-this-control-repo)
* [Repository Layout](#repository-layout)
* [Continuous Integration Examples](#continuous-integration-examples)
* [Working With Site Modules](#working-with-site-modules)
* [Bolt Project](#bolt-project)
* [Hiera and Plan Data](#hiera-and-plan-data)
* [Copy This Repo Into Your Own Git Server](#copy-this-repo-into-your-own-git-server)
  * [GitLab](#gitlab)
  * [Bitbucket/Stash](#bitbucketstash)
  * [GitHub](#github)
  * [GitHub Enterprise](#github-enterprise)
* [Code Manager Setup](#code-manager-setup)

## What You Get From This control-repo

This is a template [control repository](https://help.puppet.com/pe/current/topics/control_repo.htm) with the minimum scaffolding needed to get started with [r10k](https://help.puppet.com/pe/current/topics/r10k.htm) or Puppet Enterprise's [Code Manager](https://help.puppet.com/pe/current/topics/code_mgr.htm).

The important files and items in this template are as follows:

* Basic examples of roles and profiles, packaged as PDK modules.
* An `adhoc` PDK module for tasks and plans that do not fit into a specific role or profile.
* Example Puppet language and Ruby functions with unit tests.
* An example Puppetfile with various module references.
* An example Hiera configuration file and data directory with pre-created `common.yaml` and `nodes` directory.
* The Hiera hierarchy matches the default hierarchy that ships with PE.
* The Hiera configuration also includes a Bolt `plan_hierarchy` example and commented eyaml configuration guidance.
* An [environment.conf](https://help.puppet.com/core/current/Content/PuppetCore/config_file_environment.htm) that configures the site module path and config\_version script.
* An example [config\_version](https://help.puppet.com/core/current/Content/PuppetCore/config_file_environment.htm#Allowedsettings) script that outputs the git commit ID of the code that was used during a Puppet run.
* An example [Bolt project](https://help.puppet.com/bolt/current/topics/projects.htm).
* Example CI pipeline templates for GitHub Actions, GitLab CI, Azure Pipelines, and Bitbucket Pipelines.

## Repository Layout

Here's a visual representation of the structure of this repository:

```text
control-repo/
├── .github/
│   └── workflows/
│       ├── ci.yml.example          # GitHub Actions workflow.
│       └── pdk.yml.example         # Reusable PDK workflow.
├── bolt/                           # Bolt project directory.
│   ├── plans/                      # Bolt project only plans directory.
│   ├── tasks/                      # Bolt project only tasks directory.
│   ├── bolt-project.yaml           # Bolt project config.
│   └── inventory.yaml              # Bolt target inventory.
├── data/                           # Hiera data directory.
│   ├── nodes/                      # Node-specific data goes here.
│   ├── plan/                       # Bolt plan data.
│   └── common.yaml                 # Common data goes here.
├── manifests/
│   └── site.pp                     # Main manifest.
├── scripts/
│   ├── config_version-r10k.rb      # r10k deployment metadata.
│   ├── config_version-rugged.rb    # Puppet Enterprise rugged helper.
│   └── config_version.sh           # Selects a config_version helper.
├── site-modules/                   # Site modules in $modulepath.
│   ├── adhoc/                      # PDK task and plan examples.
│   ├── profile/                    # Profile classes and functions.
│   └── role/                       # Role classes that compose profiles.
├── .gitlab-ci.yml.example          # GitLab CI example pipeline.
├── azure-pipelines.yml.example     # Azure Pipelines example pipeline.
├── bitbucket-pipelines.yml.example # Bitbucket Pipelines example pipeline.
├── LICENSE
├── Puppetfile                      # External modules for deployment.
├── README.md
├── environment.conf                # modulepath and config_version.
└── hiera.yaml                      # Hiera hierarchy.
```

## Continuous Integration Examples

The repository includes example CI definitions for several common git platforms:

* GitHub Actions: `.github/workflows/ci.yml.example` and `.github/workflows/pdk.yml.example`
* GitLab CI: `.gitlab-ci.yml.example`
* Azure Pipelines: `azure-pipelines.yml.example`
* Bitbucket Pipelines: `bitbucket-pipelines.yml.example`

These examples run PDK validation and unit tests for the `adhoc`, `profile`, and `role` modules using the `puppet/puppet-dev-tools:puppet8` container.
To use one, copy or rename the relevant `.example` file into the filename expected by your CI provider.
For GitHub Actions, remove the `.example` suffix from both workflow files because `ci.yml` calls the reusable `pdk.yml` workflow.

The sample pipelines run on the `production` branch and on pull or merge requests targeting `production`.
If your `Puppetfile` or module fixtures need private Forge access, configure the `FORGE_KEY` secret or variable in your CI system.

## Working With Site Modules

The modules under `site-modules/` are PDK modules.
Work from the individual module directory when running PDK commands:

```shell
cd site-modules/profile
pdk validate
pdk test unit
```

The included modules demonstrate these patterns:

* `adhoc` contains example Linux and Windows tasks, an example Bolt plan, and specs for task metadata and plans.
* `profile` contains example profile classes, Hiera-backed data, Puppet language functions, Ruby functions, and unit tests.
* `role` contains example role classes and tests for composing profiles.

## Bolt Project

The `bolt/` directory is a local Bolt project.
Its `bolt-project.yaml` exposes the control repo's `site-modules` and `modules` directories to Bolt and points Bolt at the root `hiera.yaml` file.

Use `bolt/plans/` and `bolt/tasks/` for plans and tasks that belong only to this Bolt project.
Use `site-modules/adhoc` for tasks and plans that should be packaged and tested as a Puppet module.

## Hiera and Plan Data

The root `hiera.yaml` includes the standard node and common data hierarchy:

```text
data/nodes/%{trusted.certname}.yaml
data/common.yaml
```

It also includes a Bolt `plan_hierarchy` example that reads from `data/plan/common.yaml`.
This keeps plan-specific data separate from catalog data and avoids relying on per-target facts when Bolt runs outside an apply block.

The bottom of `hiera.yaml` contains a commented eyaml example for encrypted Hiera data, including the Puppet Server gem installation command, key generation step, and sample `eyaml_lookup_key` configuration.

## Copy This Repo Into Your Own Git Server

To get started with using the control-repo template in your own environment and git server, we've provided steps for the three most common servers we see:
[GitLab](#gitlab), [Bitbucket](#bitbucketstash), and [GitHub](#github).

### GitLab

1. Install GitLab.
    * <https://about.gitlab.com/downloads/>
1. After GitLab is installed you may sign in with the `root` user.
    If you didn't specify a custom password during installation, a temporary password is located in `/etc/gitlab/initial_root_password`.
1. Make a user for yourself.
1. Make an SSH key to link with your user.
    You’ll want to do this on the machine you intend to edit code from, such as your local workstation or laptop.
    * <https://docs.gitlab.com/ee/ssh/index.html>
    * <https://help.github.com/articles/generating-ssh-keys/>
1. Create a group called `puppet` (this is case sensitive).
    * <https://docs.gitlab.com/ee/user/group/index.html>
1. Add your user to the `puppet` group as well.
1. Create a project called `control-repo`, and set the Namespace to be the `puppet` group.
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your GitLab repository>`
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
    * `git remote add origin <url of your Bitbucket repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

### GitHub

Follow [GitHub's documentation](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)
to create your control repository starting from this template.

![template button](https://user-images.githubusercontent.com/1392917/117215366-f4eeb280-adb2-11eb-9108-1bd45c4d98f3.png)

### GitHub Enterprise

1. Prepare your local git client to authenticate with a **local GitHub Enterprise instance**.
    * <https://help.github.com/articles/generating-ssh-keys/>
    * <https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/>
1. Create a repository called `control-repo` in your user account or organization.
    Ensure that "Initialize this repository with a README" is not selected.
    * <https://help.github.com/articles/creating-a-new-repository/>
1. Make a note of your repository URL, using HTTPS or SSH depending on your
    security configuration.
1. Clone this control repository to your laptop/workstation:
    * `git clone <repository url>`
    * `cd control-repo`
1. Remove this repository as the origin remote:
    * `git remote remove origin`
1. Add your internal repository as the origin remote:
    * `git remote add origin <url of your GitHub repository>`
1. Push the production branch of the repository from your machine up to your git server
    * `git push origin production`

## Code Manager Setup

If you use Puppet Enterprise, see the official [documentation](https://help.puppet.com/pe/current/topics/code_mgr.htm) for enabling Code Manager.
