require 'spec_helper'

RSpec.describe Markdownlyze::Elements::Quote do
  let(:quote) do
    <<~CODE
      > First item
      > Second item
      > Third item
    CODE
  end

  let(:lines) { quote.split("\n") }

  describe '#value' do
    it 'returns the elements of the quote' do
      element = described_class.new(line: lines.first, index: 0, lines: lines)

      expect(element.value).to eq(
        [
          'First item',
          'Second item',
          'Third item'
        ]
      )
    end

    context 'when next elements are after the quote' do
      let(:quote) do
        <<~CODE
          > First item
          > Second item
          > Third item

          Some other text
        CODE
      end

      it 'returns the elements of the quote' do
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
