# frozen_string_literal: true

require 'open3'
require 'spec_helper'

describe 'adhoc::nix_example task' do
  include_examples 'a task with metadata',
                   task_name: 'nix_example',
                   implementation: 'sh',
                   input_method: 'environment'

  it 'prints the expected message when invoked by bash' do
    script_path = task_implementation_path('nix_example', 'sh')
    stdout, stderr, status = Open3.capture3('/usr/bin/env', 'bash', script_path)

    expect(status.exitstatus).to eq(0)
    expect(stderr).to eq('')
    expect(stdout).to eq("Hello from adhoc::nix_example\n")
  end
end
