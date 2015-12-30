# header と footer の設定

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def doc_header
    <<-"EOS"
<link href="./css/github.css" rel="stylesheet" />
<link href="./css/monokai.css" rel="stylesheet" />
<article class="markdown-body">
    EOS
  end

  def doc_footer
    <<-"EOS"
</article>
    EOS
  end
end
