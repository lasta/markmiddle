#! /usr/bin/env ruby
require 'redcarpet'
require 'tempfile'
require 'open3'

$LOAD_PATH << './lib/'
require 'document_style'
require 'prerenderer'
require 'preprocess'
require 'postprocess'
#require 'block_code_pygments'

$VERSION = '0.1'

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
  mkd_document = prerenderer(text)
  markmiddle_to_html = Redcarpet::Markdown.new(MarkmiddleRenderer, $RENDER_OPTIONS)
  markmiddle_to_html.render(mkd_document)
end

def coderay(text)
  markmiddle_to_html = Redcarpet::Markdown.new(CoderayRenderer, $RENDER_OPTIONS)
  markmiddle_to_html.render(text)
end

def pygments(text)
  markmiddle_to_html = Redcarpet::Markdown.new(PygmentsRenderer, $RENDER_OPTIONS)
  markmiddle_to_html.render(text)
end

# ドキュメントファイルの読み込み
unless ARGV[0].nil? then
  input_file = File.open(ARGV[0])
else
  input_file = File.open('./sample.mm')
end
output = markmiddle(input_file.read)

puts postprocess(output, true)
