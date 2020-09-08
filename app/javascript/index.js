function calculate() {
  const priceForm = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const gain = document.getElementById("profit")
  if (priceForm.value == 0){
    fee.innerHTML = 0;
    gain.innerHTML = 0;
  } else {
    fee.innerHTML = Math.floor(priceForm.value / 10);
    gain.innerHTML = priceForm.value - fee.innerHTML;
  }
}
setInterval(calculate, 1000);