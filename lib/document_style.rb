# header と footer の設定

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def doc_header
    # github   : for whole markdown
    # monokai  : for codeblock
    # math/tex : for mathblock to use mathjax
    charset = '<meta charset="UTF-8">' + "\n"
    css_whole = '<link href="./css/github.css" rel="stylesheet" />' + "\n"
    css_codeblock = '<link href="./css/monokai.css" rel="stylesheet" />' + "\n"
    css_mathblock = <<-"EOS"
<script type="math/tex"></script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({ tex2jax: { 
      inlineMath: [['$$','$$'], ["\(","\)"]],
      displayMath: [['(((math',')))'], ["\[", "\]"]]
    } 
  });
</script>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML">
</script>
    EOS
    header = "<head>\n"
    header += charset
    header += css_whole
    # header += css_codeblock
    header += css_mathblock
    header += "</head>\n"
  end

  def doc_footer
    <<-"EOS"
    EOS
  end
end
