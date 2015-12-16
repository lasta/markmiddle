#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'
require 'open3'

# require './lib/code_block.rb'
require './lib/preprocess'
require './lib/process'

$VERSION = '0.0.1'

def markmiddle(text)
  options = {
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
    # :filter_html => true,
    :with_toc_data => true,
    :hard_wrap => true
  }
  markmiddle_to_html = Redcarpet::Markdown.new(MarkmiddleRenderer, options)
  markmiddle_to_html.render(text)
end

# ドキュメントファイルの読み込み
# input_file = File.open(ARGV[0])
input_file = File.open('./sample.mm')
puts markmiddle(input_file.read)
