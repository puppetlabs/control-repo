# frozen_string_literal: true

# Simple facts return a single value and are the most common type of fact.
#
# There are two required parts for a simple fact:
# 1. The fact name, declared using `Facter.add(:fact_name)`.
# 2. The fact value, declared using `setcode`.
#   `setcode` can take either a string (which will be evaluated as a command) or a block (which will be evaluated as Ruby code).
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/writing_facts_simple_resolutions.htm

# Minimal example.
# Returns the path to the Ruby executable on the system.
Facter.add(:rubypath) do
  setcode 'which ruby' # Executes the command `which ruby` to find the path to the Ruby executable
end

# The above example while it works on Linux systems, it won't work on Windows.
# To find the Ruby path for both Linux and Windows, we can use the `confine` method.
# `confine` is used to determine whether the resolution is suitable (and therefore is evaluated).
# A fact can have zero (always suitable) or more `confine` statements.
# Each additional `confine` statement further restricts the suitability of the fact.

# Only suitable for Linux systems.
Facter.add(:rubypath) do
  confine kernel: 'Linux'
  setcode 'which ruby'
end

# Only suitable for Windows systems.
Facter.add(:rubypath) do
  confine kernel: 'Windows'
  setcode 'where.exe ruby'
end

# Using confine with a block allows for more complex logic to determine suitability.
Facter.add(:rubypath) do
  confine do
    Facter.value(:kernel) == 'Windows' && Facter.value(:osfamily) == 'Windows'
  end
  setcode 'where.exe ruby'
end

# When multiple resolutions are available for a fact, resolutions are evaluated from highest weight value to lowest.
# By default, the weight of a resolution is the number of confine statements it has, so that more specific resolutions take priority over less specific resolutions.
# External facts have a weight of 10,000
# When a fact has more than one resolution with the same weight, the first resolution that returns a value other than `nil` sets the fact’s value.

# This fact will be evaluated first on Windows systems
Facter.add(:rubypath) do
  has_weight 10_001
  confine kernel: 'Windows'
  setcode 'where.exe ruby'
end

# This fact will be evaluated after the above and external facts on Windows systems only if the previous facts do not return a value.
Facter.add(:rubypath) do
  has_weight 10
  confine kernel: 'Windows'
  setcode do
    'C:\Ruby\bin\ruby.exe' # Set the string directly instead of running a command to find the path.
  end
end

# Facter also supports configuring a timeout for fact resolutions.
# If a resolution takes longer than the specified timeout, it will be logged as an error.
# The timeout is specified in seconds.

Facter.add(:rubypath, timeout: 0.2) do
  confine kernel: 'Linux'
  setcode 'which ruby'
end

# Facter::Core::Execution#execute also accepts a timeout option.
Facter.add(:rubypath) do
  confine kernel: 'Linux'
  setcode do
    Facter::Core::Execution.execute('which ruby', timeout: 0.2)
  rescue Facter::Core::Execution::ExecutionFailure
    Facter.warn "Execution of 'which ruby' timed out after 0.2 seconds"
  end
end
