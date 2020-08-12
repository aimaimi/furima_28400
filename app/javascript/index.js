window.addEventListener('load', function(){
  const priceForm = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")

  priceForm.addEventListener('change', function (){
    fee.innerHTML = Math.floor(this.value / 10);
    gain.innerHTML = this.value - fee.innerHTML;
  })
})