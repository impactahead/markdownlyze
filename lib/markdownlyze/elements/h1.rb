module Markdownlyze
  module Elements
    class H1 < Base
      def value
        @line.gsub(/^# /, '')
      end
    end
  end
end
