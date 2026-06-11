# frozen_string_literal: true

require 'spec_helper'

describe 'structured custom facts' do
  let(:fact_file) { File.expand_path('../../../lib/facter/structured_custom_fact.rb', __dir__) }

  before(:each) do
    Facter.clear
    load fact_file

    add_fact_values(
      'interfaces' => 'lo0,eth0,eth1',
      'ipaddress_lo0' => '127.0.0.1',
      'ipaddress_eth0' => '192.0.2.10',
    )
  end

  after(:each) do
    Facter.clear
  end

  it 'returns interface names as an array' do
    expect(Facter.value(:interfaces_array)).to eq(['lo0', 'eth0', 'eth1'])
  end

  it 'returns interface IP addresses as a hash' do
    expect(Facter.value(:interfaces_hash)).to eq(
      'lo0' => '127.0.0.1',
      'eth0' => '192.0.2.10',
    )
  end
end
