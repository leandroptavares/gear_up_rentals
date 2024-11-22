import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banner"
export default class extends Controller {

  static targets = ["bannerElement"]

  connect() {
    console.log("hi from banner")
  }

  hide() {
    console.log
    this.bannerElementTarget.classList.toggle("d-none")
  }
}
