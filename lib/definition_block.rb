# Definition List

def definition_block(document, deflist_symbol)
  document.gsub! /^([\s\S]+?)\n#{deflist_symbol}\ ([\s\S]+?)\n/ do
    "<dl>\n  <dt>#{$1}</dt>\n  <dd>#{$2}</dd>\n</dl>\n"
  end
end
