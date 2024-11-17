require 'spec_helper'

RSpec.describe Markdownlyze::Elements::Ol do
  let(:ordered_list) do
    <<~CODE
      1. First item
      2. Second item
      3. Third item
    CODE
  end

  let(:lines) { ordered_list.split("\n") }

  describe '#value' do
    it 'returns the rows of the ordered list' do
      element = described_class.new(line: lines.first, index: 0, lines: lines)

      expect(element.value).to eq(
        [
          'First item',
          'Second item',
          'Third item'
        ]
      )
    end

    context 'when next elements are after the ordered list' do
      let(:ordered_list) do
        <<~CODE
          1. First item
          2. Second item
          3. Third item

          Some other text
        CODE
      end

      it 'returns the rows of the ordered list' do
        element = described_class.new(line: lines.first, index: 0, lines: lines)
  
        expect(element.value).to eq(
          [
            'First item',
            'Second item',
            'Third item'
          ]
        )
      end
    end
  end
end
