require 'spec_helper'

RSpec.describe Markdownlyze::Elements::H4 do
  describe '#value' do
    it 'returns the value of the header' do
      element = described_class.new(line: '#### Header', index: 0, lines: ['#### Header'])

      expect(element.value).to eq('Header')
    end
  end
end
