# header と footer の設定

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def doc_header
    # github   : for whole markdown
    # monokai  : for codeblock
    # math/tex : for mathblock to use mathjax
    <<-"EOS"
<head>
<link href="./css/github.css" rel="stylesheet" />
<link href="./css/monokai.css" rel="stylesheet" />
<script type="math/tex"></script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ tex2jax: { inlineMath: [['$','$'], ["\\(","\\)"]] } });
</script>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML">
</script>
</head>
    EOS
  end

  def doc_footer
    <<-"EOS"
    EOS
  end
end
