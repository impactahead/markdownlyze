module Markdownlyze
  module Elements
    class Paragraph < ::Markdownlyze::Elements::Base
      def value = to_html(@line)
    end
  end
end
