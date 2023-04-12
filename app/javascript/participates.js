function pullDown() {
  const pullDownButton = document.getElementById("participant-dropdown");
  const pullDownParents = document.getElementById("pull-down");

  pullDownButton.addEventListener('mouseover', function() {
    pullDownParents.classList.toggle("hidden");
  });

  pullDownParents.addEventListener('mouseout', function() {
    pullDownParents.classList.add("hidden");
  });
}

window.addEventListener('load', pullDown);
