require 'redcarpet'
require 'tempfile'
require 'open3'

# Execution Block

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def preprocess(document)
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
end
