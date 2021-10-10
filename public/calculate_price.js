window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener('input', function(){
  
    const inputValue = priceInput.value
    const tax = Math.ceil(inputValue * 0.1)
    const profit = Math.floor(inputValue * 0.9)

    priceTax = document.getElementById("add-tax-price")
    priceTax.innerHTML = tax

    priceProfit = document.getElementById("profit")
    priceProfit.innerHTML = profit
  });

});