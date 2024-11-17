require 'spec_helper'

describe Markdownlyze do
  describe '.parse_file' do
    it 'parses the markdown file' do
      file_path = File.expand_path('../files/file.md', __dir__)

      expect(Markdownlyze.parse_file(file_path)).to eq([
        { element: :h1, value: 'First header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h2, value: 'Second header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is another paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h3, value: 'Third header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a third paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h4, value: 'Fourth header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a fourth paragraph.' },
        { element: :blank_line, value: nil },
        { element: :code_block, value: "def hello\n  :hello\nend", language: 'ruby' },
        { element: :blank_line, value: nil },
        { element: :image, value: './images/image.png' }
      ])
    end
  end

  describe '.parse' do
    it 'parses the content in markdown format' do
      markdown = <<~MARKDOWN
        # First header

        This is a paragraph.

        ## Second header

        This is another paragraph.

        ### Third header

        This is a third paragraph.

        #### Fourth header

        This is a fourth paragraph.

        ```ruby
        def hello
          :hello
        end
        ```

        ![image](./images/image.png)

        Here comes the table:

        | Column 1 | Column 2 | Column 3 |
        | -------- | -------- | -------- |
        | Value 1  | Value 2  | Value 3  |

        Here comes the ordered list:

        1. First item
        2. Second item
        3. Third item

        Here comes the unordered list:

        * First item
        * Second item
        * Third item
      MARKDOWN

      expect(Markdownlyze.parse(markdown)).to eq([
        { element: :h1, value: 'First header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h2, value: 'Second header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is another paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h3, value: 'Third header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a third paragraph.' },
        { element: :blank_line, value: nil },
        { element: :h4, value: 'Fourth header' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'This is a fourth paragraph.' },
        { element: :blank_line, value: nil },
        { element: :code_block, value: "def hello\n  :hello\nend", language: 'ruby' },
        { element: :blank_line, value: nil },
        { element: :image, value: './images/image.png' },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'Here comes the table:' },
        { element: :blank_line, value: nil },
        { element: :table, value: [['Column 1', 'Column 2', 'Column 3'], ['Value 1', 'Value 2', 'Value 3']] },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'Here comes the ordered list:' },
        { element: :blank_line, value: nil },
        { element: :ol, value: ['First item', 'Second item', 'Third item'] },
        { element: :blank_line, value: nil },
        { element: :paragraph, value: 'Here comes the unordered list:' },
        { element: :blank_line, value: nil },
        { element: :ul, value: ['First item', 'Second item', 'Third item'] }
      ])
    end
  end
end
