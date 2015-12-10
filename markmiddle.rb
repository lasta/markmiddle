#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)


# input_file = File.open(ARGV[0], 'r') do |io|
#   # markmiddle.preamble(io.read)
#   puts markdown.render(io.read)
# end

# 正規表現を書くべきはここじゃない
# 別の場所からdeflistの記号を定義する

$deflist_symbol = ":"
def definition_list(document)
  if document =~ /^(\S+)\n#{$deflist_symbol}\ (\S+)/ then
  # if document =~ /^(\S+)\n:\ (\S+)/ then
    puts "<dl>\n  <dt>" + $1 + "</dt>\n  <dd>" + $2 + "</dd>\n</dl>\n"
  end
end

test_definitionlist = <<"EOS"
def_title
: def_desc
EOS

puts definition_list(test_definitionlist)
