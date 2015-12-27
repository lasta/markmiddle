# Definition List
def definition_block(document, deflist_symbol)
  deflist_symbol = ':'
  # document.gsub! /#{$WITHOUT_PRE["begin"]}(.+)\n^: ([\s\S]+?)[(\n\n)\z]/ do
  document.gsub! /^(?!.+<pre>)(.+)\n^: ([\s\S]+?)[(\n\n)\z]/ do
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


