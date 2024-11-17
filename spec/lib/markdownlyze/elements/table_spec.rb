require 'spec_helper'

RSpec.describe Markdownlyze::Elements::Table do
  let(:table) do
    <<~CODE
      | Column 1 | Column 2 | Column 3 |
      | -------- | -------- | -------- |
      | Value 1  | Value 2  | Value 3  |
      | Value 4  | Value 5  | Value 6  |
    CODE
  end

  let(:lines) { table.split("\n") }

  describe '#value' do
    it 'returns the rows of the table' do
      element = described_class.new(line: lines.first, index: 0, lines: lines)

      expect(element.value).to eq(
        [
          ['Column 1', 'Column 2', 'Column 3'],
          ['Value 1', 'Value 2', 'Value 3'],
          ['Value 4', 'Value 5', 'Value 6']
        ]
      )
    end

    context 'when next elements are after the table' do
      let(:table) do
        <<~CODE
          | Column 1 | Column 2 | Column 3 |
          | -------- | -------- | -------- |
          | Value 1  | Value 2  | Value 3  |
          | Value 4  | Value 5  | Value 6  |

          Some other text
        CODE
      end

      it 'returns the rows of the table' do
        element = described_class.new(line: lines.first, index: 0, lines: lines)
  
        expect(element.value).to eq(
          [
            ['Column 1', 'Column 2', 'Column 3'],
            ['Value 1', 'Value 2', 'Value 3'],
            ['Value 4', 'Value 5', 'Value 6']
          ]
        )
      end
    end
  end
end
