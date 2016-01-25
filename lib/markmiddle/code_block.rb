# Code block with syntax highlighting
require 'pp'

# true  : coderay
# false : pygments
# TODO: とりあえずcoderayでやる。いずれpygmentsに移行する
if true
  require 'coderay'
  def code_block(document)
    document.gsub! /```(.*?)\n([\s\S]+?)```/ do
      if $1 == ''
        # exec-ed shell command
        '<pre><code>' + $2 + '</code></pre>'
      else
        # exec-ed interpreter with script
        CodeRay.scan($2, $1).div(:line_numbers => :table)
      end
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
