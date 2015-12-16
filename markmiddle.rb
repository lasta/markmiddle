#! /usr/bin/env ruby
require 'redcarpet'
require 'html/pipeline'
require 'tempfile'
require 'open3'
require 'coderay'

$VERSION = '0.0.1'

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:line_numbers => :table)
  end
end

def markdown(text)
  coderayified = CodeRayify.new(:filter_html => true, 
                                :hard_wrap => true)
  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :strikethrough => true,
    :lax_html_blocks => true,
    :superscript => true
  }
  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
  # markdown_to_html.render(text).html_safe
  markdown_to_html.render(text)
end

# input_file = File.open(ARGV[0], 'r') do |io|
#   # markmiddle.preamble(io.read)
#   puts markdown.render(io.read)
# end
# test document
$input_file = File.open('/Users/lasta/Dropbox/Iwasaki-Lab/lmml/markmiddle/src/sample.mkd', 'r')
$output_document = ''


# 正規表現を書くべきはここじゃない
# deflist内のHTMLの扱いをどうにかしないとならない
# 別の場所からdeflistの記号を定義する

$deflist_symbol = ":"
def definition_list(document)
  if document =~ /^(.+)\n#{$deflist_symbol}\ (.+)/ then
  # if document =~ /^(\S+)\n:\ (\S+)/ then
    return "<dl>\n  <dt>" + $1 + "</dt>\n  <dd>" + $2 + "</dd>\n</dl>\n"
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
    # out : 標準出力と標準エラーの両方が入る
    # Open3.#caputure3 を用いると、stdout, stderr に分割できる
    out, status = nil
    # execするスクリプト本体 source_file
    # source_file = Tempfile.new('', 'r', 0777)
    source_file = Tempfile.new('')
    begin
      source_file.write $2
      source_file.rewind # ポインタを先頭に
      begin
        out, status = Open3.capture2e($1 + " " + source_file.path)
      rescue
        puts "execution_block error"
      end
    ensure
      source_file.close
      source_file.unlink
    end
  end
  return out
end


# begin--------------------------------
# test document
test_document = <<"EOS"
definition list title
: definition list description

{{{ruby
p 'hello'
hoge
}}}

hoge
: fuga

```ruby
def hello
  puts 'hello'
end
EOS

# test code

# puts definition_list(test_document)
# puts execution_block(test_document)
puts markdown(test_document)
# end--------------------------------
