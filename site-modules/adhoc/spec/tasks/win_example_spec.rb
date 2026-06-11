# frozen_string_literal: true

require 'open3'
require 'spec_helper'

describe 'adhoc::win_example task' do
  include_examples 'a task with metadata',
                   task_name: 'win_example',
                   implementation: 'ps1',
                   input_method: 'powershell'

  let(:powershell_path) do
    candidate_names = Gem.win_platform? ? ['pwsh.exe', 'powershell.exe', 'pwsh', 'powershell'] : ['pwsh', 'powershell']

    ENV.fetch('PATH', '').split(File::PATH_SEPARATOR).each do |directory|
      candidate_names.each do |name|
        candidate_path = File.join(directory, name)
        return candidate_path if File.file?(candidate_path) && File.executable?(candidate_path)
      end
    end

    nil
  end

  it 'prints the expected message when invoked by PowerShell' do
    skip 'PowerShell runtime not available in PATH' unless powershell_path

    script_path = task_implementation_path('win_example', 'ps1')
    stdout, stderr, status = Open3.capture3(
      powershell_path,
      '-NoLogo',
      '-NoProfile',
      '-NonInteractive',
      '-File',
      script_path,
    )

    expect(status.exitstatus).to eq(0)
    expect(stderr).to eq('')
    expect(stdout.delete("\r")).to eq("Hello from adhoc::win_example\n")
  end
end
