window.addEventListener('load', function(){
  const priceForm = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")

  priceForm.addEventListener('click', function (){
    fee.innerHTML = priceForm.innerHTML / 10 ;
    gain.innerHTML = priceForm.innerHTML - fee.innerHTML ;
  })
})