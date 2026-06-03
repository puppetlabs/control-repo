#!/usr/bin/env python

# External facts provide a way to use arbitrary executables or scripts as facts, or set facts statically with structured data.
# A shebang (#!) is always required for executable facts on Unix.
# If the shebang is missing, the execution of the fact fails.
# For Facter to parse the output, the script should return key-value pairs, JSON, or YAML.
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/external_facts.htm

import json

data = {"key1" : "value1", "key2" : "value2" }
print(json.dumps(data))
