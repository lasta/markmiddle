# Definition List

def definition_block(document, deflist_symbol)
  document.gsub! /^(.+?)\n#{deflist_symbol}\ ([\s\S]+?)\n/ do
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