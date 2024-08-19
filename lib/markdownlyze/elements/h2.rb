module Markdownlyze
  module Elements
    class H2 < ::Markdownlyze::Elements::Base
      def value
        @line.gsub(/^## /, '')
      end
    end
  end
end
