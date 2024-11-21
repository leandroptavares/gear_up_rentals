import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {

  static targets = ["startDate", "endDate", "totalPrice", "result", "SubmitButton"]
  static values = { pricePerDay: Number }

  connect() {
    console.log("hi from total price")
    this.SubmitButtonTarget.disabled = true;
  }

  sum() {
    const pricePerDay = this.pricePerDayValue;
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    if (startDate && !isNaN(startDate) && endDate && !isNaN(endDate)) {
      const daysDifference = endDate.getTime() - startDate.getTime();
      const aDayInMs = 24 * 60 * 60 * 1000;
      const totalDays = Math.round(daysDifference / aDayInMs);
      let TotalPrice = totalDays * pricePerDay;
      console.log(TotalPrice);

      if (TotalPrice > 0) {
        this.SubmitButtonTarget.disabled = false;
        this.totalPriceTarget.classList.remove("d-none");
        this.totalPriceTarget.innerHTML = "";
        this.totalPriceTarget.insertAdjacentHTML("beforeend", `Total price: $${TotalPrice}`);
        this.resultTarget.value = TotalPrice;
      } else {
        this.SubmitButtonTarget.disabled = true;
        this.totalPriceTarget.classList.add("d-none");
      }
    } else {
      this.SubmitButtonTarget.disabled = true;
    }
  }
}
