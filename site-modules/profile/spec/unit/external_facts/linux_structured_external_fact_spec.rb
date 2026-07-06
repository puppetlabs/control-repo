# frozen_string_literal: true

require 'spec_helper'
require 'json'

describe 'linux_structured_external_fact.py' do
  let(:facts_dir) { File.expand_path('../../../facts.d', __dir__) }
  let(:fact_file) { File.join(facts_dir, 'linux_structured_external_fact.py') }

  before(:each) do
    Facter.clear
  end

  after(:each) do
    Facter.clear
  end

  it 'is executable for Facter to parse' do
    expect(File.executable?(fact_file)).to be(true)
  end

  it 'runs the script directly when the environment supports it' do
    script_output = skip_unless_external_fact_runnable!(fact_file)
    allow(Facter::Core::Execution).to receive(:execute_command).and_call_original

    load_external_facts(fact_file)

    observed_values = JSON.parse(script_output)

    expect(Facter.value(:key1)).to eq(observed_values.fetch('key1'))
    expect(Facter.value(:key2)).to eq(observed_values.fetch('key2'))
  end
end
