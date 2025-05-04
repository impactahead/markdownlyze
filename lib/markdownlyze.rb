require 'redcarpet'

require_relative 'markdownlyze/element_name_matcher'

require_relative 'markdownlyze/elements/base'
require_relative 'markdownlyze/elements/h1'
require_relative 'markdownlyze/elements/h2'
require_relative 'markdownlyze/elements/h3'
require_relative 'markdownlyze/elements/h4'
require_relative 'markdownlyze/elements/image'
require_relative 'markdownlyze/elements/remote_image'
require_relative 'markdownlyze/elements/blank_line'
require_relative 'markdownlyze/elements/paragraph'
require_relative 'markdownlyze/elements/code_block'
require_relative 'markdownlyze/elements/table'
require_relative 'markdownlyze/elements/ol'
require_relative 'markdownlyze/elements/ul'
require_relative 'markdownlyze/elements/quote'

module Markdownlyze
  class << self
    def parse(content)
      markdown_lines = content.to_s.split("\n")
      skip_until = nil

      elements = markdown_lines.map.with_index do |line, index|
        unless skip_until.nil?
          next if index < skip_until
        end

        element_name = ::Markdownlyze::ElementNameMatcher.call(
          current_line: line,
          next_line: markdown_lines[index + 1]
        )

        element_class = ::Markdownlyze::Elements.const_get(element_name.to_s.split('_').map(&:capitalize).join)
        element = element_class.new(
          line: line,
          index: index,
          lines: markdown_lines
        )

        { element: element_name, value: element.value }.merge(element.options).tap do
          skip_until = element.skip_until
        end
      end

      elements.compact
    end

    def parse_file(file_path)
      parse(File.read(file_path))
    end
  end
end
