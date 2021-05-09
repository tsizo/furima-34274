window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
  console.log(inputValue);

  const salesCommission = document.getElementById("add-tax-price");
salesCommission.innerHTML= Math.floor(inputValue*0.1)
console.log(salesCommission);

const profitNumber = document.getElementById("profit");
const result=Math.floor(inputValue*0.1)
profitNumber.innerHTML = Math.floor(inputValue-result)
})
});