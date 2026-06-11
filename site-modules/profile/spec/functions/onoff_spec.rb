# frozen_string_literal: true

require 'spec_helper'

describe 'profile::onoff' do
  it { is_expected.to run.with_params(true).and_return('On') }
  it { is_expected.to run.with_params('true').and_return('On') }
  it { is_expected.to run.with_params('TrUe').and_return('On') }

  it { is_expected.to run.with_params(false).and_return('Off') }
  it { is_expected.to run.with_params('false').and_return('Off') }
  it { is_expected.to run.with_params('FaLsE').and_return('Off') }
  it { is_expected.to run.with_params(nil).and_return('Off') }

  it { is_expected.to run.with_params('standby').and_return('standby') }
  it { is_expected.to run.with_params('untrue').and_return('untrue') }
end
