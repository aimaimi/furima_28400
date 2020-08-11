window.addEventListener('load', function(){
  const priceForm = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")

  priceForm.oninput = priceDisplay;

  function priceDisplay(){
      fee.innerHTML = 100
      gain.innerHTML = 900
  }
})