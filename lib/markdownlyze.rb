require 'redcarpet'

require_relative 'markdownlyze/element_name_matcher'

module Markdownlyze
  class << self
    def parse(content)
      
    end

    def parse_file(file_path)
      parse(File.read(file_path))
    end
  end
end
