var checkterm = document.getElementById('formCheckTerm');
checkterm.onclick = function() {
  var element = document.getElementById('termBtn');
  if(checkterm.checked) {
    element.classList.remove('disabled');
  } else {
    element.classList.add('disabled');
  }
}