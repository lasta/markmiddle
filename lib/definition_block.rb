require './markmiddle'
# Definition List
def definition_block(document, deflist_symbol)
  deflist_symbol = ':'
  # document.gsub! /^([\s\S]+?)\n#{deflist_symbol}\ ([\s\S]+?)\n/ do
  document.gsub! /^(.+?)\n:\ ([\s\S]+?)[(\n\n)\z]/ do
    <<-EOS
<p>
  <dl>
    <dt>#{$1}</dt>
    <dd>#{$2}</dd>
  </dl>
</p>

    EOS
  end
end


