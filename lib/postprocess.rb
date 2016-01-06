def postprocess(document, isUse)
  if isUse 
    require 'kramdown'
    Kramdown::Document.new(document).to_html
  else
    document
  end
end
