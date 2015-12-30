require 'redcarpet'
require 'pygments'

# Code block with syntax highlighting

# Pygments.start '/usr/local/bin/pygmentize'
# 
# code = File.read '/Users/udzura/.rvm/gems/ruby-1.9.3-p194@samples/gems/sinatra-1.3.3/lib/sinatra/base.rb'
# puts Pygments.highlight code, lexer: 'ruby', formatter: 'terminal'

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    unless language == nil
      Pygments.highlight(code, lexer: language, formatter: 'html')
    else
      Pygments.highlight(code, lexer: 'Markdown', formatter: 'html')
    end
  end
end

class PygmentsRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    unless language == nil
      Pygments.highlight(code, lexer: language, formatter: 'html')
    else
      Pygments.highlight(code, lexer: 'Markdown', formatter: 'html')
    end
  end
end
