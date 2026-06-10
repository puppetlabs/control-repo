require 'spec_helper_acceptance'

describe 'profile::base' do
  let(:pp) do
    <<-MANIFEST
      include profile::base
    MANIFEST
  end

  it 'applies idempotently' do
    idempotent_apply(pp)
  end
end
