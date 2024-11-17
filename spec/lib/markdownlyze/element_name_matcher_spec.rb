require 'spec_helper'

RSpec.describe Markdownlyze::ElementNameMatcher do
  describe '.call' do
    it 'matches h1 element' do
      expect(
        described_class.call(
          current_line: '# Hello',
          next_line: nil
        )
      ).to eq(:h1)
    end

    it 'matches h2 element' do
      expect(
        described_class.call(
          current_line: '## Hello',
          next_line: nil
        )
      ).to eq(:h2)
    end

    it 'matches h3 element' do
      expect(
        described_class.call(
          current_line: '### Hello',
          next_line: nil
        )
      ).to eq(:h3)
    end

    it 'matches h4 element' do
      expect(
        described_class.call(
          current_line: '#### Hello',
          next_line: nil
        )
      ).to eq(:h4)
    end

    it 'returns blank_line for blank line' do
      expect(
        described_class.call(
          current_line: '',
          next_line: nil
        )
      ).to eq(:blank_line)
    end

    it 'returns blank_line for nil' do
      expect(
        described_class.call(
          current_line: nil,
          next_line: nil
        )
      ).to eq(:blank_line)
    end

    it 'returns image for image definition' do
      expect(
        described_class.call(
          current_line: '![image](./images/image.png)',
          next_line: nil
        )
      ).to eq(:image)
    end

    it 'returns code_block for code block' do
      expect(
        described_class.call(
          current_line: '```ruby',
          next_line: nil
        )
      ).to eq(:code_block)
    end

    it 'returns paragraph for paragraph' do
      expect(
        described_class.call(
          current_line: 'Hello',
          next_line: nil
        )
      ).to eq(:paragraph)
    end

    it 'returns table for table' do
      expect(
        described_class.call(
          current_line: '| Column 1 | Column 2 | Column 3 |',
          next_line: '| -------- | -------- | -------- |'
        )
      ).to eq(:table)
    end

    it 'returns ordered list for ordered list' do
      expect(
        described_class.call(
          current_line: '1. First item',
          next_line: '2. Second item'
        )
      ).to eq(:ol)
    end

    it 'returns paragraph for incomplete ordered list' do
      expect(
        described_class.call(
          current_line: '1. First item',
          next_line: 'And some other story'
        )
      ).to eq(:paragraph)
    end

    it 'returns paragraph for incomplete table' do
      expect(
        described_class.call(
          current_line: '| Column 1 | Column 2 |',
          next_line: 'This is some text'
        )
      ).to eq(:paragraph)
    end
  end
end
