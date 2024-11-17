module Markdownlyze
  module Elements
    class Base
      attr_reader :skip_until

      def initialize(line:, index:, lines:)
        @line = line
        @index = index
        @lines = lines
        @skip_until = nil
      end

      def options = {}

      private

      def to_html(value)
        # avoid case when 1. something is created as one element ol list
        if value.to_s.match?(/^\d+\. .*/)
          captures = value.match(/^(?<start_number>\d+)\. (?<raw_value>.*)/).named_captures
          parsed_value = markdown.render(captures.fetch('raw_value')).gsub(/\<(|\/)p\>/, '').gsub("\n", '').gsub("&#39;", "'")
          element_number = captures.fetch('start_number')

          "#{element_number}. #{parsed_value}"
        elsif value.to_s.strip == '>'
          ''
        else
          markdown.render(value).gsub(/\<(|\/)p\>/, '').gsub("\n", '').gsub("&#39;", "'")
        end
      end

      def markdown
        @markdown ||= begin
          renderer = Redcarpet::Render::HTML.new(render_options = {})
          Redcarpet::Markdown.new(renderer, extensions = {})
        end
      end
    end
  end
end
