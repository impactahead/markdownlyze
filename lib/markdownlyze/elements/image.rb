module Markdownlyze
  module Elements
    class Image < Base
      def value
        @line.match(/\!\[.*\]\(\.\/images\/(?<file_name>.*)\)/).named_captures.fetch('file_name')
      end
    end
  end
end
