require 'tempfile'
require 'open3'

# Execution Block
def execution_block(document, tag)
  tag_open, tag_close = tag

  # コマンド実行
  document.gsub! /^#{tag_open}(.+?)#{tag_close}$/ do
    exec1($1)
  end
  document.gsub! /^#{tag_open}(.+?)#{tag_close}`$/ do
    ret = "```\n"
    ret += exec1($1)
    ret += "```\n\n"
  end

  # スクリプト実行
  document.gsub! /^#{tag_open}(.*?)\n([\s\S]+?)#{tag_close}$/ do
    exec2($1, $2)
  end
  document.gsub! /^#{tag_open}(.*?)\n([\s\S]+?)#{tag_close}`$/ do
    ret = "```\n"
    ret += exec2($1, $2)
    ret += "```\n\n"
  end
end

def exec1(command)
  # out : 標準出力と標準エラーの両方が入る
  # Open3.#caputure3 を用いると、stdout, stderr に分割できる
  out, status = nil
  begin
    out, status = Open3.capture2e(command)
  rescue
    puts "execution_block error"
  end
  return out
end

def exec2(command, source)
  # out : 標準出力と標準エラーの両方が入る
  # Open3.#caputure3 を用いると、stdout, stderr に分割できる
  out, status = nil
  # execするスクリプト本体 source_file
  # source_file = Tempfile.new('', 'r', 0777)
  source_file = Tempfile.new('')
  begin
    source_file.write source
    source_file.rewind # ポインタを先頭に
    begin
      out, status = Open3.capture2e(command + " " + source_file.path)
    rescue
      puts "execution_block error"
    end
  ensure
    source_file.close
    source_file.unlink
  end
  return out
end
