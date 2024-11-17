# Markdownlyze

Turn markdown documents into easily parseable format

## Getting started

Install the library:

```bash
gem install markdownlyze
```

## Usage

Parse markdown:

```ruby
markdown = <<~CODE
  # Hello world
  
  This is something super exceptional!
  
  * First thing
  * Second thing
  
  That is it!
CODE

Markdownlyze.parse(markdown) # => [
#   {:element=>:h1, :value=>"Hello world"},
#   {:element=>:blank_line, :value=>nil},
#   {:element=>:paragraph, :value=>"This is something super exceptional!"},
#   {:element=>:blank_line, :value=>nil},
#   {:element=>:ul, :value=>["First thing", "Second thing"]},
#   {:element=>:blank_line, :value=>nil},
#   {:element=>:paragraph, :value=>"That is it!"}
# ]
```
