# frozen_string_literal: true

require 'spec_helper'

describe 'profile::example::postgresql' do
  package_supported_os = on_supported_os.reject { |os, _os_facts| os.start_with?('windows-') }

  package_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default parameters' do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_package('postgresql').with_ensure('latest') }

        it do
          is_expected.to contain_service('postgresql')
            .with_ensure('running')
            .with_enable(true)
        end

        it { is_expected.to contain_package('postgresql').that_notifies('Service[postgresql]') }
      end

      context 'with a package version specified' do
        let(:params) { { version: '16' } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('postgresql').with_ensure('16') }
      end

      context 'when service management is disabled' do
        let(:params) { { manage_service: false } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_package('postgresql') }
        it { is_expected.not_to contain_service('postgresql') }
      end
    end
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'when package management is disabled' do
        let(:params) { { manage_package: false } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.not_to contain_package('postgresql') }
        it { is_expected.to contain_service('postgresql') }
      end

      context 'when package and service management are disabled' do
        let(:params) { { manage_package: false, manage_service: false } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.not_to contain_package('postgresql') }
        it { is_expected.not_to contain_service('postgresql') }
      end
    end
  end
end
