lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdownlyze/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
  s.add_runtime_dependency 'redcarpet', '3.6.0'
  s.name        = 'markdownlyze'
  s.version     = Markdownlyze::Version
  s.date        = '2024-08-19'
  s.summary     = "Turn markdown documents into easily parseable format"
  s.description = "Turn markdown documents into easily parseable format"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'contact@paweldabrowski.com'
  s.files       = Dir['lib/**/*.rb', 'spec/helper.rb']
end
