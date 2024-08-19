require 'spec_helper'

RSpec.describe Markdownlyze::Elements::CodeBlock do
  let(:code_block) do
    <<~CODE
      ```ruby
      def hello
        :hello
      end
      ```
    CODE
  end

  let(:lines) { code_block.split("\n") }

  describe '#value' do
    it 'returns the value of the code block' do
      element = described_class.new(line: lines.first, index: 0, lines: lines)

      expect(element.value).to eq("def hello\n  :hello\nend")
    end
  end

  describe '#options' do
    it 'returns the options of the code block' do
      element = described_class.new(line: lines.first, index: 0, lines: lines)

      expect(element.options).to eq({ language: 'ruby' })
    end
  end
end
