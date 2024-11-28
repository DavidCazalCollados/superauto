import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["pricePerDay"]

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log(this.pricePerDayTarget.innerText)
  }

  price() {
  }
}
