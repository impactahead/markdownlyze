module Markdownlyze
  module Elements
    class H4 < Base
      def value
        @line.gsub(/^#### /, '')
      end
    end
  end
end
