require 'spec_helper'

RSpec.describe Markdownlyze::Elements::Image do
  describe '#value' do
    it 'returns the value of the image file' do
      element = described_class.new(line: '![image](./images/image.png)', index: 0, lines: ['![image](./images/image.png)'])

      expect(element.value).to eq('./images/image.png')
    end
  end
end
