require 'spec_helper'

RSpec.describe Markdownlyze::Elements::RemoteImage do
  describe '#value' do
    it 'returns the value of the image file' do
      element = described_class.new(line: '![image](https://example.com/image.png)', index: 0, lines: ['![image](https://example.com/image.png)'])

      expect(element.value).to eq('https://example.com/image.png')
    end
  end
end

