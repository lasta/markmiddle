require './markmiddle'
# Definition List
def definition_block(document, deflist_symbol)
  # unless document.match(/^```.*\n^(.+?)\n#{deflist_symbol}\ ([\s\S]+?)\n```\n/)
  # end
  document.gsub! /^(.+?)\n#{deflist_symbol}\ (.+?)\n/ do
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


