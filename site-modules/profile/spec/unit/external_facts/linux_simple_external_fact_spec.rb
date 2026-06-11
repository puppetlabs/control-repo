# frozen_string_literal: true

require 'spec_helper'

describe 'linux_simple_external_fact.sh' do
  let(:facts_dir) { File.expand_path('../../../facts.d', __dir__) }
  let(:fact_file) { File.join(facts_dir, 'linux_simple_external_fact.sh') }

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

    observed_values = script_output.each_line(chomp: true).each_with_object({}) do |line, values|
      key, value = line.split('=', 2)
      next if value.nil?

      values[key] = value
    end

    expect(Facter.value(:rubypath)).to eq(observed_values.fetch('rubypath'))
    expect(Facter.value(:rubyversion)).to eq(observed_values.fetch('rubyversion'))
  end
end
