module Markdownlyze
  module Elements
    class CodeBlock < ::Markdownlyze::Elements::Base
      def value
        @lines[@index..-1].each_with_index do |subline, subindex|
          if subline.to_s.strip == '```'
            @skip_until = @index + subindex + 1
            break
          end
        end

        @lines[(@index + 1)..(@skip_until - 2)].join("\n")
      end

      def options
        { language: language }
      end

      private

      def language
        (@line.match(/```(?<language>[a-z].*)/) || { language: 'bash' })[:language]
      end
    end
  end
end
