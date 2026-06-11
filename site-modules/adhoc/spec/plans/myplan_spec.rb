# frozen_string_literal: true

require 'spec_helper'

if ENV['GEM_BOLT']
  require 'bolt_spec/plans'

  describe 'adhoc::myplan', :bolt do
    include BoltSpec::Plans

    let(:targets) { ['windows-target', 'nix-target'] }

    def modulepath
      [File.expand_path('../fixtures/modules', __dir__), File.expand_path('../../..', __dir__)]
    end

    def inventory_data
      {
        'targets' => [
          {
            'name' => 'windows-target',
            'facts' => { 'kernel' => 'windows' },
          },
          {
            'name' => 'nix-target',
            'facts' => { 'kernel' => 'Linux' },
          },
        ],
      }
    end

    before(:all) do
      BoltSpec::Plans.init
    end

    before(:each) do
      execute_any_plan
      allow_apply_prep
      allow_apply
    end

    it 'runs the facts subplan and dispatches tasks to matching targets' do
      expect_task('adhoc::win_example').with_targets(['windows-target']).always_return({})
      expect_task('adhoc::nix_example').with_targets(['nix-target']).always_return({})

      result = run_plan('adhoc::myplan', 'targets' => targets, 'package' => 'git')

      expect(result.ok?).to be(true)
    end
  end
else
  RSpec.describe 'adhoc::myplan', :bolt do
    it 'requires GEM_BOLT to run Bolt plan specs' do
      skip 'Set GEM_BOLT=1 to enable Bolt plan specs'
    end
  end
end
