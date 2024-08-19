require 'redcarpet'

require_relative 'markdownlyze/element_name_matcher'

require_relative 'markdownlyze/elements/base'
require_relative 'markdownlyze/elements/h1'
require_relative 'markdownlyze/elements/h2'
require_relative 'markdownlyze/elements/h3'
require_relative 'markdownlyze/elements/h4'
require_relative 'markdownlyze/elements/image'
require_relative 'markdownlyze/elements/blank_line'
require_relative 'markdownlyze/elements/paragraph'

module Markdownlyze
  class << self
    def parse(content)
      markdown_lines = content.to_s.split("\n")

      markdown_lines.map.with_index do |line, index|
        element_name = ::Markdownlyze::ElementNameMatcher.call(line)
        element_class = ::Markdownlyze::Elements.const_get(element_name.to_s.split('_').map(&:capitalize).join)
        element = element_class.new(
          line: line,
          index: index,
          lines: markdown_lines
        )

        { element: element_name, value: element.value }
      end
    end

    def parse_file(file_path)
      parse(File.read(file_path))
    end
  end
end
