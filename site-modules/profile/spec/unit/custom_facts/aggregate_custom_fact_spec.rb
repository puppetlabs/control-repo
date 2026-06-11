# frozen_string_literal: true

require 'spec_helper'

describe 'aggregate custom facts' do
  let(:fact_file) { File.expand_path('../../../lib/facter/aggregate_custom_fact.rb', __dir__) }

  before(:each) do
    Facter.clear
  end

  after(:each) do
    Facter.clear
  end

  def encoded_sha256(value)
    Base64.encode64(Digest::SHA256.digest(value)).strip
  end

  it 'returns MAC hashes and primary interface status by interface' do
    networking = {
      'primary' => 'eth0',
      'interfaces' => {
        'eth0' => { 'mac' => '00:11:22:33:44:55' },
        'eth1' => { 'mac' => '66:77:88:99:aa:bb' },
      },
    }
    add_fact_values('networking' => networking)

    load fact_file

    expect(Facter.value(:networking_primary_sha)).to eq(
      'eth0' => {
        'mac_sha256' => encoded_sha256('00:11:22:33:44:55'),
        'primary?' => true,
      },
      'eth1' => {
        'mac_sha256' => encoded_sha256('66:77:88:99:aa:bb'),
        'primary?' => false,
      },
    )
  end

  it 'returns the sum of physical and virtual free memory' do
    add_fact_values('memoryfree_mb' => 512.25, 'swapfree_mb' => 128.75)

    load fact_file
    expect(Facter.value(:total_free_memory_mb)).to eq(641.0)
  end
end
