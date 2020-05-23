// Figure out how to add LaTeX packages I'll need. 

window.MathJax = {
  loader: {load: ['[tex]/physics']},
  tex: {
    inlineMath: [['$', '$'], ['\\(', '\\)']], 
    displayMath: [["$$", "$$"], ['\\[', '\\]']], // For some reason, $$ doesn't get rendered in kramdown. 
    processEscapes: true, 
    processEnvironments: true, // process \begin{xxx}...\end{xxx} outside math mode
//    packages: {
//      '[+]': ['physics']
//    }
    macros: {
      bra: ["{\\langle #1 \\rvert}", 1],
      ket: ["{\\lvert #1 \\rangle}", 1], 
      braket: ["\\langle #1 \\rangle", 1] 
    }
  },
  svg: {
    fontCache: 'global'
  }
};



// window.MathJax.Hub.Config({
//   tex2jax: {
//   inlineMath: [['$','$'], ['\\(','\\)']],
//   displayMath: [ ['$$','$$'], ['\[','\]'] ],
//   processEscapes: true},
//   jax: ["input/TeX","input/MathML","input/AsciiMath","output/CommonHTML"],
//   extensions: ["tex2jax.js","mml2jax.js","asciimath2jax.js","MathMenu.js","MathZoom.js","AssistiveMML.js", "[Contrib]/a11y/accessibility-menu.js"],
//   TeX: {
//   extensions: ["AMSmath.js","AMSsymbols.js","noErrors.js","noUndefined.js"],
//   equationNumbers: {
//   autoNumber: "AMS"
//   }
//   }
//   });
