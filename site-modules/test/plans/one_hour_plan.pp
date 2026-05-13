plan test::one_hour_plan (
  TargetSpec $targets,
  Integer $duration_minutes = 60
) {

  notice("Starting 1-hour plan using latest deployed file")

  # --------------------------------------------------
  # STEP 1: Read file from latest deployment
  # (happens at plan start → safe)
  # --------------------------------------------------
  $file_content = file('test/message.txt')

  # --------------------------------------------------
  # STEP 2: Copy file to target (CRITICAL)
  # Prevents issues if new deployment happens
  # --------------------------------------------------
  upload_file('test/message.txt', '/tmp/message.txt', $targets)

  # Optional: also write content explicitly
  run_command("echo '${file_content}' > /tmp/message_copy.txt", $targets)

  # --------------------------------------------------
  # STEP 3: Run for at least 1 hour
  # --------------------------------------------------
  $end_time = Timestamp() + ($duration_minutes * 60)

  while Timestamp() < $end_time {

    notice("Running iteration at ${Timestamp()}")

    # Use the file repeatedly
    run_command('cat /tmp/message.txt', $targets)

    # Sleep 5 minutes per cycle
    run_command('sleep 300', $targets)
  }

  notice("Plan completed after ${duration_minutes} minutes")
}
