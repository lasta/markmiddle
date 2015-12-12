#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'securerandom'

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
def execution_block(document)
  if document =~ /^\{\{\{(.+)\n([\s\S]+?)\}\}\}/ then
    filename = SecureRandom.hex(16).to_s
    File.write(filename, $2)
    begin
      exec($1 + " " + filename)
    rescue
      puts "exec error"
    end
    File.unlink filename
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
