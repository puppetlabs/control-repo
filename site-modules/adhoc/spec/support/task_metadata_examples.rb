# frozen_string_literal: true

require 'json'

module TaskMetadataSpecHelpers
  def module_root
    File.expand_path('../..', __dir__)
  end

  def task_metadata_path(task_name)
    File.join(module_root, 'tasks', "#{task_name}.json")
  end

  def task_metadata(task_name)
    JSON.parse(File.read(task_metadata_path(task_name)))
  end

  def task_implementation_path(task_name, extension)
    File.join(module_root, 'tasks', "#{task_name}.#{extension}")
  end
end

RSpec.configure do |config|
  config.include TaskMetadataSpecHelpers
end

RSpec.shared_examples 'a task with metadata' do |task_name:, implementation:, input_method:|
  let(:metadata) { task_metadata(task_name) }
  let(:script_path) { task_implementation_path(task_name, implementation) }

  it 'has a non-empty description' do
    expect(metadata['description']).to be_a(String)
    expect(metadata['description']).not_to be_empty
  end

  it 'declares the expected input method' do
    expect(metadata['input_method']).to eq(input_method)
  end

  it 'has a matching implementation file' do
    expect(File).to exist(script_path)
    expect(File.read(script_path).strip).not_to be_empty
  end
end
