# Code block with syntax highlighting
require 'coderay'
def code_block(document)
  document.gsub! /```(.*?)\n([\s\S]+?)```/ do
    CodeRay.scan($2, $1).div(:line_numbers => :table)
  end
end

