# frozen_string_literal: true

require 'fileutils'
require 'open3'
require 'rbconfig'
require 'tmpdir'

# Adds deterministic fact values to the current Facter collection.
#
# @param values [Hash{String, Symbol => Object}] fact names mapped to fact values
def add_fact_values(values)
  values.each do |fact_name, fact_value|
    Facter.add(fact_name) do
      has_weight 10_001
      setcode { fact_value }
    end
  end
end

# Loads external facts into the legacy Facter collection.
#
# @param fact_file [String, nil] path to a single fact file to load, or nil to load all files from facts_dir
#
# @return [Object] the loader result for the external facts
def load_external_facts(fact_file = nil)
  return LegacyFacter::Util::DirectoryLoader.new(facts_dir).load(LegacyFacter.collection) if fact_file.nil?

  Dir.mktmpdir do |external_fact_dir|
    external_fact_file = File.join(external_fact_dir, File.basename(fact_file))
    FileUtils.cp(fact_file, external_fact_file)
    FileUtils.chmod(File.stat(fact_file).mode & 0o777, external_fact_file)

    LegacyFacter::Util::DirectoryLoader.new(external_fact_dir).load(LegacyFacter.collection)
  end
end

# Skips the current example unless an external fact can run on this host.
#
# @param fact_file [String] path to the fact executable being checked
# @param command [Array<String>] command used to test whether the fact is runnable
# @param requires_windows [Boolean] whether the fact must run on Windows
#
# @return [String] captured standard output when the fact command succeeds
def skip_unless_external_fact_runnable!(fact_file, command: [fact_file], requires_windows: false)
  if requires_windows && !host_windows?
    skip "#{File.basename(fact_file)} requires a Windows environment for direct execution"
  end

  stdout, stderr, status = Open3.capture3(*command)
  return stdout if status.success?

  details = stderr.strip
  details = stdout.strip if details.empty?
  details = "exit #{status.exitstatus}" if details.empty?
  skip "#{File.basename(fact_file)} is not runnable in this environment: #{details}"
rescue Errno::ENOENT => e
  skip "#{File.basename(fact_file)} is not runnable in this environment: #{e.message}"
end

# Checks whether the current host operating system is Windows.
#
# @return [Boolean] true when the current host OS matches a Windows platform
def host_windows?
  RbConfig::CONFIG['host_os'].match?(%r{mswin|mingw|cygwin}i)
end
