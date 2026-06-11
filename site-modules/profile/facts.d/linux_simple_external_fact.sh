#!/usr/bin/env bash

# External facts provide a way to use arbitrary executables or scripts as facts, or set facts statically with structured data.
# A shebang (#!) is always required for executable facts on Unix.
# If the shebang is missing, the execution of the fact fails.
# For Facter to parse the output, the script should return key-value pairs, JSON, or YAML.
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/external_facts.htm

# By using the key-value pairs on STDOUT format, a single script can return multiple facts:
echo "rubypath=$(which ruby)"
echo "rubyversion=$(ruby -v | cut -d ' ' -f 2)"
