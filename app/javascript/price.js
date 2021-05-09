window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;

  const salesCommission = document.getElementById("add-tax-price");
salesCommission.innerHTML= Math.floor(inputValue*0.1)

const profitNumber = document.getElementById("profit");
const result=Math.floor(inputValue*0.1)
profitNumber.innerHTML = Math.floor(inputValue-result)
})
});