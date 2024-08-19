module Markdownlyze
  module Elements
    class H3 < ::Markdownlyze::Elements::Base
      def value
        @line.gsub(/^### /, '')
      end
    end
  end
end
