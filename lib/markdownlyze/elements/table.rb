module Markdownlyze
  module Elements
    class Table < ::Markdownlyze::Elements::Base
      def value
        @lines[@index..-1].each_with_index do |subline, subindex|
          if subline.count('|') < 2
            @skip_until = @index + subindex
            break
          end
        end

        table_lines = @lines[@index..(skip_until.to_i - 1)]
        headers = table_lines.shift
        table_lines.shift
        raw_table = [headers] | table_lines
        rows = raw_table.map { |row| row.split("|").map(&:strip)[1..-1] }

        if @skip_until.to_i.zero?
          @skip_until = @index + rows.size + 1
        end

        rows
      end
    end
  end
end
