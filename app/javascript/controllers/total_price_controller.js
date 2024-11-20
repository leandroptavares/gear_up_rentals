import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {

  static targets = ["startDate", "endDate", "totalPrice", "result"]
  static values = { pricePerDay: Number }

  connect() {
    console.log("hi from total price")
  }

  sum() {
    const pricePerDay = this.pricePerDayValue
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)

    if (startDate && endDate != "Invalid Date") {
      // console.log("ready to calculate")
      const daysDifference = endDate.getTime() - startDate.getTime()
      const aDayInMs = 24 * 60 * 60 * 1000
      const totalDays = Math.round(daysDifference / aDayInMs)
      // console.log(daysDifference)
      let TotalPrice = totalDays * pricePerDay
      console.log(TotalPrice)

      this.totalPriceTarget.classList.remove("d-none")
      this.totalPriceTarget.innerHTML = ""
      this.totalPriceTarget.insertAdjacentHTML("beforeend", `Total price: $${TotalPrice}`);

      this.resultTarget.value = TotalPrice
    }
  }
}
