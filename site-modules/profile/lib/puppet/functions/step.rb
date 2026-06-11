# frozen_string_literal: true

# You can use iterative types to write efficient iterative functions, or to chain together the iterative functions built into Puppet.
#
# @see https://help.puppet.com/core/current/Content/PuppetCore/functions_iterative.htm
Puppet::Functions.create_function(:step) do
  dispatch :step do
    param 'Iterable', :iterable
    param 'Integer[1]', :step
  end

  dispatch :step_block do
    param 'Iterable', :iterable
    param 'Integer[1]', :step
    block_param 'Callable[1,1]', :block
  end

  def step(iterable, step)
    # produces an Iterable
    Puppet::Pops::Types::Iterable.asserted_iterable(self, iterable).step(step)
  end

  def step_block(iterable, step, &block)
    Puppet::Pops::Types::Iterable.asserted_iterable(self, iterable).step(step, &block)
    nil
  end
end
