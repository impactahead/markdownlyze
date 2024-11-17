module Markdownlyze
  module Elements
    class Ul < ::Markdownlyze::Elements::Base
      def value
        @lines[@index..-1].each_with_index do |subline, subindex|
          if !subline.match?(/^(\*|\-) .*/)
            @skip_until = @index + subindex
            break
          end
        end

        @skip_until = @lines.size if @skip_until.nil?

        @lines[@index..(@skip_until - 1)].map { |line| line.gsub(/^(\*|\-) /, '') }
      end
    end
  end
end
