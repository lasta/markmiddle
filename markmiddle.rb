#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'
require 'open3'

require './lib/code_block.rb'
require './lib/preprocess.rb'

$VERSION = '0.0.1'

def markdown(text)
  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :strikethrough => true,
    :lax_html_blocks => true,
    :superscript => true
  }
  markdown_to_html = Redcarpet::Markdown.new(MarkmiddleRenderer, options)
  markdown_to_html.render(text)
end

# begin--------------------------------
# test document
test_document = <<"EOS"
definition list title
: definition list description

{{{ruby
puts 'hello'
# hoge
}}}

hoge
: fuga

```ruby
def hello
  puts 'hello'
end
```
EOS

# test code

puts markdown(test_document)
# end--------------------------------
