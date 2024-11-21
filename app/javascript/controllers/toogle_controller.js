import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toogle"
export default class extends Controller {

  static targets = ["Map", "button"]

  connect() {
    console.log("hi from toogle")
  }

  hide() {
    console.log("clicked")
    this.MapTarget.classList.toggle("d-none")

    if (this.buttonTarget.textContent === "Hide map") {
      this.buttonTarget.textContent = "Show map"
    } else {
      this.buttonTarget.textContent = "Hide map"
    }
  }
}
