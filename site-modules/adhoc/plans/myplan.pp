# Example plan installing a package and running other tasks.
# 
# @param TargetSpec $targets The targets to run the plan on
# @param String $package The name of the package to install
#
# @see https://help.puppet.com/bolt/current/topics/writing_plans.htm
plan adhoc::myplan(
  TargetSpec $targets,
  String $package,
) {
  # Apply a manifest block to the targets.
  #
  # @see https://help.puppet.com/bolt/current/topics/applying_manifest_blocks.htm#applying-manifest-blocks-from-a-puppet-plan
  apply_prep($targets)
  apply($targets) {
    package { $package:
      ensure => installed,
    }
  }

  # Collect facts from the targets.
  #
  # @see https://help.puppet.com/bolt/current/topics/writing_plans.htm#collect-facts-from-the-targets
  run_plan('facts', 'targets' => $targets)
  $windows_targets = get_targets($targets).filter |$target| { $target.facts['kernel'] == 'windows' }
  $nix_targets = get_targets($targets).filter |$target| { $target.facts['kernel'] != 'windows' }

  # Run task on the targets.
  #
  # @see https://help.puppet.com/bolt/current/topics/writing_plans.htm
  run_task('adhoc::win_example', $windows_targets)
  run_task('adhoc::nix_example', $nix_targets)
}
