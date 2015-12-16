require 'redcarpet'

# Definition List

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def preprocess(document)
    deflist_symbol = ':'
    document.gsub! /^([\s\S]+?)\n#{deflist_symbol}\ ([\s\S]+?)\n/ do
      "<dl>\n  <dt>#{$1}</dt>\n  <dd>#{$2}</dd>\n</dl>\n"
    end
  end
end
