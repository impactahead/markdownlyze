module Markdownlyze
  module Elements
    class H1 < ::Markdownlyze::Elements::Base
      def value
        @line.gsub(/^# /, '')
      end
    end
  end
end
