import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["pricePerDay", "startDate", "endDate"]

  connect() {
    console.log("Hello from our first Stimulus controller");
    console.log(this.pricePerDayTarget.innerText)

  }

  price(event) {
    console.log(event);
    const startDate = Date.parse(this.startDateTarget.value);
    const endDate = Date.parse(this.endDateTarget.value);

    const daysConvert = (1000 * 24 * 60 * 60);

    const diffTime = ((endDate) - (startDate)) / daysConvert;

    const intDateDays = (parseInt(this.pricePerDayTarget.innerText, 10));

    if (endDate >= startDate) {
      const intDate = intDateDays * diffTime

      this.pricePerDayTarget.innerText = `Total: ${intDate}$`
    }
  }
}
