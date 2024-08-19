require 'redcarpet'

require_relative 'markdownlyze/element_name_matcher'
require_relative 'markdownlyze/elements/h1'
require_relative 'markdownlyze/elements/h2'
require_relative 'markdownlyze/elements/h3'

module Markdownlyze
  class << self
    def parse(content)
      
    end

    def parse_file(file_path)
      parse(File.read(file_path))
    end
  end
end
