# Code block with syntax highlighting

# true  : coderay
# false : pygments
if true
  require 'coderay'
  def code_block(document)
    document.gsub! /```(.*?)\n([\s\S]+?)```/ do
      CodeRay.scan($2, $1).div(:line_numbers => :table)
    end
  end

else 

  require 'pygments'
  def code_block(document)
    document.gsub! /```(.*?)\n([\s\S]+?)```/ do
      Pygments.highlight($2, lexer: $1, formatter: 'html')
    end
  end
end
