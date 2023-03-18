var selectedUsers = [];
var selectBox = document.querySelector('select');
var userList = document.querySelector('.selected-user-list');

selectBox.addEventListener('change', function() {

  var selectedOption = selectBox.options[selectBox.selectedIndex];
  var selectedUserId = selectedOption.value;

  if (selectedUsers.indexOf(selectedUserId) !== -1) {
    return;
  }

  selectedUsers.push(selectedUserId);

  var userElement = document.createElement('div');
  userElement.classList.add('selected-user');
  userElement.dataset.userId = selectedUserId;
  userElement.textContent = selectedOption.textContent;

  var removeButton = document.createElement('span');
  removeButton.classList.add('remove-user');
  removeButton.textContent = '×';
  removeButton.addEventListener('click', function(event) {
    var userElement = event.target.parentNode;
    var userId = userElement.dataset.userId;

    userElement.style.display = 'none';

    selectedUsers = selectedUsers.filter(function(id) {
      return id !== userId;
    });
  });
  userElement.appendChild(removeButton);

  userList.appendChild(userElement);

  var hiddenUsers = [];

  selectBox.addEventListener('change', function() {

    var restoredElement = hiddenUsers.find(function(element) {
      return element.dataset.userId === selectedUserId;
    });

    if (restoredElement) {

      restoredElement.style.display = 'block';

      hiddenUsers = hiddenUsers.filter(function(element) {
        return element.dataset.userId !== selectedUserId;
      });
    }
  });
});