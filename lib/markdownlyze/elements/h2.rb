module Markdownlyze
  module Elements
    class H2 < Base
      def value
        @line.gsub(/^## /, '')
      end
    end
  end
end
