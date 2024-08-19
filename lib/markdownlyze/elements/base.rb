module Markdownlyze
  module Elements
    class Base
      attr_reader :skip_until

      def initialize(line:, index:, lines:)
        @line = line
        @index = index
        @lines = lines
        @skip_until = nil
      end

      def options = {}
    end
  end
end
