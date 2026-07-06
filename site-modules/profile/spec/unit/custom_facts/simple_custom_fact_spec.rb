# frozen_string_literal: true

require 'spec_helper'

describe 'simple custom facts' do
  let(:fact_file) { File.expand_path('../../../lib/facter/simple_custom_fact.rb', __dir__) }

  before(:each) do
    Facter.clear
  end

  after(:each) do
    Facter.clear
  end

  it 'resolves rubypath with which ruby on Linux' do
    add_fact_values('kernel' => 'Linux', 'osfamily' => 'RedHat')
    allow(Facter::Core::Execution).to receive(:execute) do |command, *_args, **_kwargs|
      (command == 'which ruby') ? '/opt/ruby/bin/ruby' : nil
    end

    load fact_file

    expect(Facter.value(:rubypath)).to eq('/opt/ruby/bin/ruby')
  end

  it 'resolves rubypath with where ruby on Windows' do
    add_fact_values('kernel' => 'Windows', 'osfamily' => 'Windows')
    allow(Facter::Core::Execution).to receive(:execute) do |command, *_args, **_kwargs|
      (command == 'where.exe ruby') ? 'C:\Ruby32\bin\ruby.exe' : nil
    end

    load fact_file

    expect(Facter.value(:rubypath)).to eq('C:\Ruby32\bin\ruby.exe')
  end

  it 'uses the hard-coded Windows fallback when where ruby returns no value' do
    add_fact_values('kernel' => 'Windows', 'osfamily' => 'Windows')
    allow(Facter::Core::Execution).to receive(:execute).and_return(nil)

    load fact_file

    expect(Facter.value(:rubypath)).to eq('C:\Ruby\bin\ruby.exe')
  end
end
