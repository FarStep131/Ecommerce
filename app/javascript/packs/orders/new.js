const selectElement = document.querySelector('#address_options');

selectElement.addEventListener('change', (event) => {
  if(event.target.value == 'yourOwnAddress') {
    document.getElementById('registeredAddresses').style.display = 'none';
    document.getElementById('newAddress').style.display = 'none';
    document.getElementById('yourOwnAddress').style.display = 'block';
  }else if(event.target.value == 'registeredAddresses') {
    document.getElementById('yourOwnAddress').style.display = 'none';
    document.getElementById('newAddress').style.display = 'none';
    document.getElementById('registeredAddresses').style.display = 'block';
  }else if(event.target.value == 'newAddress') {
    document.getElementById('yourOwnAddress').style.display = 'none';
    document.getElementById('registeredAddresses').style.display = 'none';
    document.getElementById('newAddress').style.display = 'block';
  } else {
    document.getElementById('yourOwnAddress').style.display = 'none';
    document.getElementById('registeredAddresses').style.display = 'none';
    document.getElementById('newAddress').style.display = 'none';
  }
});
