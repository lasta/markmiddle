require './markmiddle'
# Definition List
def definition_block(document, deflist_symbol)
  puts document
  deflist_symbol = ':'
  # document.gsub! /^([\s\S]+?)\n#{deflist_symbol}\ ([\s\S]+?)\n/ do
  document.gsub! /^(?!<pre>)(.+?)\n:\ ([\s\S]+?)\n\n/ do
    <<-EOF
<p>
  <dl>
    <dt>#{$1}</dt>
    <dd>#{$2}</dd>
  </dl>
</p>

    EOF
  end
end


