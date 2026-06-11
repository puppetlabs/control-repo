# frozen_string_literal: true

require 'spec_helper'

describe 'step' do
  subject(:step_function) { find_function }

  it 'returns every nth value as an iterable' do
    result = step_function.execute([1, 2, 3, 4, 5], 2)

    expect(result.to_a).to eq([1, 3, 5])
  end

  it 'passes every nth value to a block' do
    values = []

    step_function.execute([1, 2, 3, 4, 5], 2) do |value|
      values << value
    end

    expect(values).to eq([1, 3, 5])
  end
end
