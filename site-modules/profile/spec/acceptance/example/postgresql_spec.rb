require 'spec_helper_acceptance'

describe 'profile::example::postgresql', unless: os[:family] == 'windows' do
  let(:pp) do
    <<-MANIFEST
      include profile::example::postgresql
    MANIFEST
  end

  it 'applies idempotently' do
    idempotent_apply(pp)
  end

  it 'installs the postgresql package' do
    expect(package('postgresql')).to be_installed
  end

  it 'ensures the postgresql service is running and enabled' do
    expect(service('postgresql')).to be_running
    expect(service('postgresql')).to be_enabled
  end
end
