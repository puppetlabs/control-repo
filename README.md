# A Puppet Control Repository for LAMP - Stack

Here's a visual representation of the structure of this repository:

All code contains comments with what module is required

Code tested on latest Puppet release (2019.8.1) in an enviroment consisting of a the following vm's:

- 
-

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
│   │
│   ├── manifests
│           ├── platform                      # 
│               ├── baseline                  # baseslines for platform specefic manifests
│               │    ├── 
│               │    │    ├── 
│               │    │    ├── 
│               │    │    ├── 
│               │    │    ├── 
│               │    ├── 
│               │         ├──
│               │    
│               ├──       
├── LICENSE 
├── Puppetfile                            # A list of external Puppet modules to deploy with an environment.
├── README.md
├── environment.conf                      # Environment-specific settings. Configures the modulepath and config_version.
└── hiera.yaml                            # Hiera's configuration file. The Hiera hierarchy is defined here.
```

LAMP - Stack Module

In conjunction with your control repo, create a new module/profile to perform the following:

