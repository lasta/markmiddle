#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'

$VERSION = '0.0.1'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

# input_file = File.open(ARGV[0], 'r') do |io|
#   # markmiddle.preamble(io.read)
#   puts markdown.render(io.read)
# end



# 正規表現を書くべきはここじゃない
# deflist内のHTMLの扱いをどうにかしないとならない
# 別の場所からdeflistの記号を定義する

$deflist_symbol = ":"
def definition_list(document)
  if document =~ /^(.+)\n#{$deflist_symbol}\ (.+)/ then
  # if document =~ /^(\S+)\n:\ (\S+)/ then
    puts "<dl>\n  <dt>" + $1 + "</dt>\n  <dd>" + $2 + "</dd>\n</dl>\n"
  end
end

# 参考
# http://doruby.kbmj.com/yablog/20090531/ruby_1
# 実装途中
# ファイルを0777で作成して、{{{の最後の引数にファイルを指定すれば、
# gcc -o xxx #{filename} できそうだとおもったけど、実行どうしよう
# やっぱり、コマンド1回ですぐ実行できるものでないとしんどい
def execution_block(document)
  if document =~ /^\{\{\{(.+)\n([\s\S]+?)\}\}\}/ then
    # execするスクリプト本体 source_file
    source_file = Tempfile.new('')
    begin
      source_file.write $2
      source_file.rewind # ポインタを先頭に
      begin
        exec($1 + " " + source_file.path)
      rescue
        puts "exec error"
      end
    ensure
      source_file.close
      source_file.unlink
    end
  end
end


# begin--------------------------------
# test document
test_document = <<"EOS"
definition list title
: definition list description

{{{ruby
puts 'hello'
}}}

hoge
: fuga
EOS

# test code
definition_list(test_document)
# exec blockはとりあえず動く
# 実行するたびに、vimのカレントディレクトリにファイルを生成するため、
# 放置
execution_block(test_document)
# end--------------------------------
