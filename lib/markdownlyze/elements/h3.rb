module Markdownlyze
  module Elements
    class H3 < Base
      def value
        @line.gsub(/^### /, '')
      end
    end
  end
end
