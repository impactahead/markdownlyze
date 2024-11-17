module Markdownlyze
  class ElementNameMatcher
    MATCHERS = {
      /^# .*/ => :h1,
      /^## .*/ => :h2,
      /^### .*/ => :h3,
      /^#### .*/ => :h4,
      /\!\[.*\]\(\.\/images\/.*\)/ => :image,
      /```[a-z]*/ => :code_block,
      /^\> .*/ => :quote,
      [/^1\. .*/, lambda { |next_line| next_line.to_s.match?(/^2\. .*/) }] => :ol,
      [/^(\*|\-) .*/, lambda { |next_line| next_line.to_s.match?(/^(\*|\-) .*/) }] => :ul,
      [/^|.* \| .*$/, lambda { |next_line| next_line.to_s.count('|') > 1 }] => :table
    }.freeze

    class << self
      def call(current_line:, next_line:)
        return :blank_line if current_line.nil? || current_line.strip.empty?

        MATCHERS.each do |pattern, element|
          return element if matching?(current_line, next_line, pattern)
        end

        :paragraph
      end

      private

      def matching?(current_line, next_line, pattern)
        if pattern.is_a?(Regexp)
          current_line.match?(pattern)
        else
          regex_pattern, lambda_pattern = pattern
          current_line.match?(regex_pattern) && lambda_pattern.call(next_line)
        end
      end
    end
  end
end
