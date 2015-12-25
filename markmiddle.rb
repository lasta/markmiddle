#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'
require 'open3'

# require './lib/code_block.rb'
require './lib/document_style.rb'
require './lib/preprocess'

$VERSION = '0.0.1'

$RENDER_OPTIONS = {
  :no_intra_emphasis => true,
  :tables => true,
  :fenced_code_blocks => true,
  :autolink => true,
  :disable_indented_code_blocks => true,
  :lax_spacing => true,
  :superscript => true,
  :strikethrough => true,
  :footnotes => true,
  :lax_html_blocks => true,
  :filter_html => true,
  :with_toc_data => true,
  :hard_wrap => true
}

def markmiddle(text)
  markmiddle_to_html = Redcarpet::Markdown.new(MarkmiddleRenderer, $RENDER_OPTIONS)
  markmiddle_to_html.render(text)
end

def coderay(text)
  markmiddle_to_html = Redcarpet::Markdown.new(CoderayRenderer, $RENDER_OPTIONS)
  markmiddle_to_html.render(text)
end

# ドキュメントファイルの読み込み
unless ARGV[0].nil? then
  input_file = File.open(ARGV[0])
else
  input_file = File.open('./sample.mm')
end
# puts markmiddle(input_file.read)

### ---------------------
### begin test
$test = <<-EOS

```markdown
hoge
: fuga
```

EOS

puts markmiddle($test)
### end test
### ---------------------
