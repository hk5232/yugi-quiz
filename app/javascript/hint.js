function hint() {

  const hint = document.getElementById("hint")
  const image  = document.getElementById("image2");
  const hint2  = document.getElementById("hint2");
  const txt  = document.getElementById("txt");

  hint.addEventListener('click', function(){
    hint2.setAttribute("style", "display:none !important;");
    image.setAttribute("style", "display:block;");
  });

  hint.addEventListener('click', function(){
    hint2.setAttribute("style", "display:none !important;");
    txt.setAttribute("style", "display:block;");
  });

  hint.addEventListener('mouseover', function(){
    hint.setAttribute("style", "background-color:#FFBEDA;")
  });
  hint.addEventListener('mouseout', function(){
    hint.removeAttribute("style", "background-color:#FFBEDA;")
  })
}

window.addEventListener('load', hint)