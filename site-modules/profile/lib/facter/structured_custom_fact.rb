# frozen_string_literal: true

# Structured facts can take the form of hashes or arrays.
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/writing_structured_facts.htm

# Returning an array of network interfaces
Facter.add(:interfaces_array) do
  setcode do
    interfaces = Facter.value(:interfaces)
    # the 'interfaces' fact returns a single comma-delimited string, such as "lo0,eth0,eth1"
    # this splits the value into an array of interface names
    interfaces.split(',')
  end
end

# Returning a hash of network interfaces to IP addresses
Facter.add(:interfaces_hash) do
  setcode do
    interfaces_hash = {}

    Facter.value(:interfaces_array).each do |interface|
      ipaddress = Facter.value("ipaddress_#{interface}")
      if ipaddress
        interfaces_hash[interface] = ipaddress
      end
    end

    interfaces_hash
  end
end
