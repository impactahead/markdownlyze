require 'spec_helper'

RSpec.describe Markdownlyze::ElementNameMatcher do
  describe '.call' do
    it 'matches h1 element' do
      expect(
        described_class.call('# Hello')
      ).to eq(:h1)
    end

    it 'matches h2 element' do
      expect(
        described_class.call('## Hello')
      ).to eq(:h2)
    end

    it 'matches h3 element' do
      expect(
        described_class.call('### Hello')
      ).to eq(:h3)
    end

    it 'matches h4 element' do
      expect(
        described_class.call('#### Hello')
      ).to eq(:h4)
    end

    it 'returns blank_line for blank line' do
      expect(
        described_class.call('')
      ).to eq(:blank_line)
    end

    it 'returns blank_line for nil' do
      expect(
        described_class.call(nil)
      ).to eq(:blank_line)
    end

    it 'returns image for image definition' do
      expect(
        described_class.call('![image](./images/image.png)')
      ).to eq(:image)
    end

    it 'returns code_block for code block' do
      expect(
        described_class.call('```ruby')
      ).to eq(:code_block)
    end

    it 'returns paragraph for paragraph' do
      expect(
        described_class.call('Hello')
      ).to eq(:paragraph)
    end
  end
end
