;(function($) {
  $(function(){
    $('#main').smoothState({
      prefetch: true,
      pageCacheSize: 0,
    });
  });


  // Orphans Fixer
  var all_paragraphs, i, len, p, reg;
  all_paragraphs = document.querySelectorAll('p, h1, h2, h3, li > a');
  window.p = all_paragraphs[0];
  reg = /\s([^\s<]{0,10})\s*$/;
  for (i = 0, len = all_paragraphs.length; i < len; i++) {
    p = all_paragraphs[i];
    p.innerHTML = p.innerHTML.replace(reg, "&nbsp$1");
  }
})(jQuery);