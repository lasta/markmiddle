require 'redcarpet'
require 'coderay'

# Code block with syntax highlighting

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:line_numbers => :table)
  end
end

class CoderayRenderer < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:line_numbers => :table)
  end
end

def pre_code_block(document)
  document.gsub! /(\`\`\`[\s\S]+?\`\`\`)/ do
    coderay($1) + '\n'
  end
end
