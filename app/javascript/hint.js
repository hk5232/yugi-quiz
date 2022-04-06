function hint() {

  const hint = document.getElementById("hint")
  const image  = document.getElementById("image2");
  const hint2  = document.getElementById("hint2");

  hint.addEventListener('click', function(){
    image.setAttribute("style", "display:block;");
    hint2.setAttribute("style", "display:none !important;");
  });
  hint.addEventListener('mouseover', function(){
    hint.setAttribute("style", "background-color:#FFBEDA;")
  });
  hint.addEventListener('mouseout', function(){
    hint.removeAttribute("style", "background-color:#FFBEDA;")
  })
}

window.addEventListener('load', hint)