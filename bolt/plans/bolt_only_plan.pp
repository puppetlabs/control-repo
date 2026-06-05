# This is a description for the bolt_only_plan.
#
# @param targets The targets to run the command on.
# @param message The message to echo on the targets.
plan control_repo_bolt::bolt_only_plan(
  TargetSpec $targets,
  String $message,
) {
  run_command("echo ${message}", $targets)
}
