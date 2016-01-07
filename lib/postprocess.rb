def postprocess(document, isUse)
  if isUse 
    require 'kramdown'
    kdoption = {
      hard_wrap: true,
      parse_block_html: false,
      parse_span_html: false 
    }

    Kramdown::Document.new(document, kdoption).to_html
  else
    document
  end
end
