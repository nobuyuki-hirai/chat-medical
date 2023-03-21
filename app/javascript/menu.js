window.addEventListener('load', function(){
  const selectList = document.querySelector('.invitation-user__list');
  const selectedList = document.querySelector('.selected-user__list');
  const selectedOptions = new Set();

  selectList.addEventListener('change', () => {
    const selectedValue = selectList.value;
    const selectedText = selectList.options[selectList.selectedIndex].text;

    if (selectedOptions.has(selectedValue)) {
      alert('既に選択されています');
      return;
    }

    const selectedOption = document.createElement('div');
    selectedOption.innerText = selectedText;
    selectedList.appendChild(selectedOption);

    selectedOption.addEventListener('click', () => {
      selectedOptions.delete(selectedValue);
      selectedOption.remove();
    });

    selectedOptions.add(selectedValue);
    selectList.selectedIndex = 0;
  });
});