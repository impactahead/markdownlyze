module Markdownlyze
  module Elements
    class Paragraph < ::Markdownlyze::Elements::Base
      def value = @line
    end
  end
end
