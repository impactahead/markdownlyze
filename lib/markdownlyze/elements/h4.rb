module Markdownlyze
  module Elements
    class H4 < ::Markdownlyze::Elements::Base
      def value
        @line.gsub(/^#### /, '')
      end
    end
  end
end
