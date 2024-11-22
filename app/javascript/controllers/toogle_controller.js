import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toogle"
export default class extends Controller {

  static targets = ["Map", "button"]

  connect() {
    console.log("hi from toogle")
  }

  hide() {
    console.log("clicked")
    this.MapTarget.classList.toggle("invisible")

    if (this.buttonTarget.textContent === "Show map") {
      this.buttonTarget.textContent = "Hide map"
    } else {
      this.buttonTarget.textContent = "Show map"
    }
  }
}
