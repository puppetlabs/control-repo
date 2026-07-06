# frozen_string_literal: true

# Aggregate resolutions allow you to split up the resolution of a fact into separate chunks.
# By default, Facter merges hashes with hashes or arrays with arrays, resulting in a structured fact.
# You can also aggregate the chunks into a flat fact using concatenation, addition, or any other function that you can express in Ruby code.
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/writing_facts_aggregate_resolutions.htm

require 'digest'
require 'base64'

# Building a structured fact progressively
Facter.add(:networking_primary_sha, type: :aggregate) do
  chunk(:sha256) do
    interfaces = {}

    Facter.value(:networking)['interfaces'].each do |interface, values|
      next unless values['mac']

      hash = Digest::SHA256.digest(values['mac'])
      encoded = Base64.encode64(hash)
      interfaces[interface] = { mac_sha256: encoded.strip }
    end

    interfaces
  end

  chunk(:primary?) do
    interfaces = {}

    Facter.value(:networking)['interfaces'].each_key do |interface|
      interfaces[interface] = { primary?: (interface == Facter.value(:networking)['primary']) }
    end

    interfaces
  end
  # Facter merges the return values for the two chunks
  # automatically, so there's no aggregate statement.
  #
  # Returns:
  #   {
  #     bridge0 => {
  #       mac_sha256 => "bfgEFV7m1V04HYU6UqzoNoVmnPIEKWRSUOU650j0Wkk=",
  #       primary?   => false
  #     },
  #     en0 => {
  #       mac_sha256 => "6Fd3Ws2z+aIl8vNmClCbzxiO2TddyFBChMlIU+QB28c=",
  #       primary?   => true
  #     },
  #     ...
  #   }
end

# Chunks can have dependencies on each other, and the return value for any required chunks is passed as arguments to the block.
Facter.add(:networking_primary_sha, type: :aggregate) do
  chunk(:sha256) do
    interfaces = {}

    Facter.value(:networking)['interfaces'].each do |interface, values|
      next unless values['mac']

      hash = Digest::SHA256.digest(values['mac'])
      encoded = Base64.encode64(hash)
      interfaces[interface] = { mac_sha256: encoded.strip }
    end

    interfaces
  end

  # The return value for any required chunks is passed as arguments to the block.
  chunk(:primary?, require: [:sha256]) do |interfaces|
    interfaces.each do |interface, values|
      values[:primary?] = (interface == Facter.value(:networking)['primary'])
    end

    interfaces
  end
end

# Building a flat fact progressively with addition
Facter.add(:total_free_memory_mb, type: :aggregate) do
  chunk(:physical_memory) do
    Facter.value(:memoryfree_mb)
  end

  chunk(:virtual_memory) do
    Facter.value(:swapfree_mb)
  end

  aggregate do |chunks|
    # The return value for this block determines the value of the fact.
    sum = 0
    chunks.each_value do |i|
      sum += i
    end

    sum
  end
end
