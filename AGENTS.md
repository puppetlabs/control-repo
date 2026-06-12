# Project Guidelines

## Repository Shape

This is a Puppet control repository for r10k or Puppet Enterprise Code Manager.
Keep root-level control repo files focused on environment configuration, Hiera data, Bolt project content, CI examples, and deployment metadata.
These guidelines govern the repository root and every path under it, including `site-modules/adhoc`, `site-modules/profile`, and `site-modules/role` when one of those modules is the active working context.

- `Puppetfile` declares external modules for deployment.
- `environment.conf` configures the module path and config_version script.
- `hiera.yaml` uses the node and common hierarchy under `data/` and includes a Bolt `plan_hierarchy` example under `data/plan/`.
- `bolt/` is a local Bolt project with project-only plans, tasks, and inventory.
- `site-modules/` contains the in-repo Puppet modules used by the control repo.

## Documentation and Reference Sources

Always reference modern Puppet documentation at <https://help.puppet.com/> first.
Use legacy Puppet documentation at <https://puppet.com/docs/> only when the user explicitly requests legacy documentation.
The [Puppet Enterprise MCP server](https://help.puppet.com/pe/current/topics/adding-an-mcp-server.htm) is allowed when it is configured and relevant, but it is optional and must not be required for general control repo work.

## General Principles

- Ask or inspect for the user's Puppet edition, Puppet Enterprise version, deployment workflow, CI system, and module ownership before assuming environment-specific behavior.
- Keep changes aligned with the roles and profiles pattern. Roles should compose profiles, profiles should contain site policy, component modules should stay reusable, and each node should be classified with one role where practical.
- Keep environment-specific values out of component modules. Expose configurable behavior through typed class parameters and resolve values through Hiera, `lookup()`, trusted facts, or the node classifier as appropriate.
- Never place secrets in plain text Puppet code or data. Use an encrypted Hiera backend such as eyaml, and use the Puppet `Sensitive` data type for sensitive parameters.
- Prefer small, testable patches that preserve PDK module structure, metadata, fixtures, Puppetfile dependencies, Bolt project boundaries, and `environment.conf` and `hiera.yaml` semantics.
- Explain recommendations with evidence from the repository and modern Puppet documentation links. Treat Puppet Enterprise-specific options such as Code Manager and the node classifier as conditional on the user's environment.
- After code edits, follow the required gates in the Quality Gates section. For control repo-level changes, validate Puppet syntax, Hiera data, Puppetfile changes, Bolt content, and CI examples with the narrowest applicable check.
- For reviews or assessments, gather evidence from repo-local files such as the Puppetfile, Hiera hierarchy and data, `manifests/site.pp`, roles and profiles, Bolt project content, CI configuration, secrets handling, and validation output before prioritizing recommendations.
- If the user supplies external Puppet output, logs, reports, or metrics, use that evidence. When a relevant Puppet Enterprise MCP server is configured, it may also be used. Otherwise, ask for relevant output before making environment-specific claims.

## Site Modules

All directories under `site-modules/` are PDK modules.
Work from the individual module directory when making module changes, for example:

```shell
cd site-modules/profile
pdk validate
pdk test unit
```

The included site modules follow these roles:

- `site-modules/adhoc` contains ad hoc Bolt tasks and plans that are packaged and tested as a Puppet module.
- `site-modules/profile` contains profile classes, Hiera-backed data, Puppet language functions, Ruby functions, and tests.
- `site-modules/role` contains role classes that compose profiles.

### Profiles and Roles Pattern

The roles and profiles method separates code into three levels:

- Component modules: Normal modules that manage one particular technology, for example `puppetlabs/apache`.
- Profiles: Wrapper classes that use multiple component modules to configure a layered technology stack.
- Roles: Wrapper classes that use multiple profiles to build a complete system configuration.

#### Rules for profile classes

There are rules for writing profile classes.

- Make sure you can safely include any profile multiple times — don't use resource-like declarations on them.
- Profiles can include other profiles.
- Profiles own all the class parameters for their component classes.
  If the profile omits one, that means you definitely want the default value; the component class shouldn't use a value from Hiera data.
  If you need to set a class parameter that was omitted previously, refactor the profile.
- There are three ways a profile can get the information it needs to configure component classes:
  - If your business always uses the same value for a given parameter, hardcode it.
  - If you can't hardcode it, try to compute it based on information you already have.
  - Finally, if you can't compute it, look it up in your data.
    To reduce lookups, identify cases where multiple parameters can be derived from the answer to a single question.

#### Rules for role classes

There are rules for writing role classes.

- The only thing roles should do is declare profile classes with include. Don't declare any component classes or normal resources in a role.
  Optionally, roles can use conditional logic to decide which profiles to use.
- Roles should not have any class parameters of their own.
- Roles should not set class parameters for any profiles. (Those are all handled by data lookup.)
- The name of a role should be based on your business's conversational name for the type of node it manages.
  This means that if you regularly call a machine a "Jenkins primary server," it makes sense to write a role named role::jenkins::primaryserver.
  But if you call it a "web server," you shouldn't use a name like role::nginx — go with something like role::web instead.

## Quality Gates

Required gates for every touched site module are:

```shell
pdk validate
pdk test unit
```

Run these commands from each touched module directory under `site-modules/`.
Changes are not complete until the relevant module's validation and unit tests pass.
If `pdk` is not installed, stop and prompt the user to install PDK using <https://help.puppet.com/pdk/current/topics/pdk_install.htm>.
Do not continue without PDK unless the user explicitly says to continue without PDK; if they do, report the PDK gates as explicitly waived and incomplete.

For control repo-level changes, use the narrowest applicable checks:

```shell
puppet parser validate manifests/site.pp
r10k puppetfile check
ruby -e 'require "yaml"; Dir.glob("data/**/*.{yaml,eyaml}").each { |file| YAML.safe_load_file(file, aliases: true) }'
bolt plan show --project bolt
```

Use `puppet parser validate` for Puppet manifests, `r10k puppetfile check` for Puppetfile syntax, the Ruby YAML check for Hiera data matching `data/**/*.{yaml,eyaml}`, and `bolt plan show --project bolt` to load Bolt plans and surface diagnostics.
Validate changed CI examples with the relevant provider's YAML or pipeline validator when available.

Puppet Litmus acceptance testing may optionally be run for `site-modules/profile` when the environment supports it, but it is not a required quality gate.

## CI Examples

The repository includes example CI definitions for GitHub Actions, GitLab CI, Azure Pipelines, and Bitbucket Pipelines.
These examples run PDK validation and unit tests for the `adhoc`, `profile`, and `role` modules using the `puppet/puppet-dev-tools:puppet8` container.

When adapting a CI example, preserve the required PDK validation and unit test coverage for all site modules.

## Hiera and Bolt Data

Use `data/nodes/%{trusted.certname}.yaml` for node-specific catalog data and `data/common.yaml` for common catalog data.
Use `data/plan/common.yaml` for Bolt plan data so plan lookups stay separate from catalog data and do not rely on per-target facts outside an apply block.
