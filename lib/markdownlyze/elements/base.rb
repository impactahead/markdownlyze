module Markdownlyze
  module Elements
    class Base
      def initialize(line:, index:, lines:)
        @line = line
        @index = index
        @lines = lines
      end
    end
  end
end
