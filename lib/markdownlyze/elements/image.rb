module Markdownlyze
  module Elements
    class Image < ::Markdownlyze::Elements::Base
      def value
        @line.match(/\!\[.*\]\(\.\/images\/(?<file_name>.*)\)/).named_captures.fetch('file_name')
      end
    end
  end
end
