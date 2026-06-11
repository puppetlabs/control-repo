# frozen_string_literal: true

require 'spec_helper'

describe 'profile::upcase' do
  it { is_expected.to run.with_params('hello').and_return('HELLO') }
  it { is_expected.to run.with_params('Already Up').and_return('ALREADY UP') }
  it { is_expected.to run.with_params('').and_return('') }
end
