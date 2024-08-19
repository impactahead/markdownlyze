module Markdownlyze
  class ElementNameMatcher
    MATCHERS = {
      /^# .*/ => :h1,
      /^## .*/ => :h2,
      /^### .*/ => :h3,
      /^#### .*/ => :h4,
      /\!\[.*\]\(\.\/images\/.*\)/ => :image,
      /```[a-z]*/ => :code_block
    }.freeze

    def self.call(line)
      return :blank_line if line.nil? || line.strip.empty?

      MATCHERS.each do |pattern, element|
        return element if line.match?(pattern)
      end

      :paragraph
    end
  end
end
