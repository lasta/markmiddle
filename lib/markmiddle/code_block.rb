# Code block with syntax highlighting

def code_block(document)
  document.gsub! /(```[sS]+?```)/ do
    coderay($1) + '\n'
  end
end
