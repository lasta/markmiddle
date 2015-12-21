require 'tempfile'
require 'open3'

# Execution Block

def execution_block(document, tag)
  tag_open, tag_close = tag
  #unless document.match /^```.*\n^#{tag_open}([\s\S]+?)\n([\s\S]+?)#{tag_close}\n```/
    document.gsub! /^#{tag_open}([\s\S]+?)\n([\s\S]+?)#{tag_close}/ do
      exec($1, $2)
    end
  #end
end

def exec(command, source)
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
