require 'redcarpet'
require 'coderay'

# Code block with syntax highlighting

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    unless language == nil
      CodeRay.scan(code, language).div(:line_numbers => :table)
    else
      CodeRay.scan(code, 'Markdown').div(:line_numbers => :table)
    end
  end
end

class CoderayRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    unless language == nil
      CodeRay.scan(code, language).div(:line_numbers => :table)
    else
      CodeRay.scan(code, 'Markdown').div(:line_numbers => :table)
    end
  end
end
