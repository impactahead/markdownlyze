module Markdownlyze
  module Elements
    class RemoteImage < ::Markdownlyze::Elements::Base
      def value
        @line.match(/\!\[.*\]\((?<url>.*)\)/).named_captures.fetch('url')
      end
    end
  end
end
