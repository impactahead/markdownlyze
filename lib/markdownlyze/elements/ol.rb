module Markdownlyze
  module Elements
    class Ol < ::Markdownlyze::Elements::Base
      def value
        @lines[@index..-1].each_with_index do |subline, subindex|
          if !subline.match?(/^\d+\. .*/)
            @skip_until = @index + subindex
            break
          end
        end

        @skip_until = @lines.size if @skip_until.nil?

        @lines[@index..(@skip_until - 1)].map { |line| line.gsub(/^\d+\. /, '') }
      end
    end
  end
end
