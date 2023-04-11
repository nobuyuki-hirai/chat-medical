window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("participant-dropdown")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('click', function() {
    pullDownParents.classList.toggle("hidden");
  })

})