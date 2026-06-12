# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/example'

RSpec.describe 'the example type' do
  it 'loads' do
    expect(Puppet::Type.type(:example)).not_to be_nil
  end
end
