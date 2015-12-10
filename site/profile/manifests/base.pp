# Base profiles include all the classes that should be included on all nodes.
# For cross-platform compatibility, this is broken up into platform-appropriate
# subclasses.  This class applies the appropriate base profile based on the
# $::kernel fact.

class profile::base {

  # Include a platform-appropriate base profile
  case $::kernel {
    'Linux':   { include profile::base::linux   }
    'windows': { include profile::base::windows }
  }

}
