#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'
require 'open3'

require './lib/code_block.rb'
require './lib/preprocess.rb'

$VERSION = '0.0.1'

def markmiddle(text)
  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :strikethrough => true,
    :lax_html_blocks => true,
    :superscript => true
  }
  markmiddle_to_html = Redcarpet::Markdown.new(MarkmiddleRenderer, options)
  markmiddle_to_html.render(text)
end

# ドキュメントファイルの読み込み
# input_file = File.open(ARGV[0])
input_file = File.open('./sample.mm')
puts markmiddle(input_file.read)
