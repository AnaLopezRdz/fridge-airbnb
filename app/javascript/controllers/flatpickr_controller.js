import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate"]
  connect() {
    console.log (document.getElementById("startDate1").innerText)
    console.log (document.getElementById("endDate1").innerText)
    flatpickr(this.startDateTarget, {
              enableDate: true,
              enable: [
                {
                  from: document.getElementById("startDate1").innerText,
                  to: document.getElementById("endDate1").innerText
                }],

              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#end_date"})],
              onChange: this.updateTotal.bind(this)
            });

    flatpickr(this.endDateTarget, {
      onChange: this.updateTotal.bind(this)
    });
    this.updateTotal(); // Initial calculation
  }
  updateTotal() {
    const startDateValue = this.startDateTarget.value;
    const endDateValue = this.endDateTarget.value;
    const officePrice = parseFloat(document.getElementById("office-price").innerText);
    const cleaningFee = parseFloat(document.getElementById("cleaning-fee").innerText);

    if (startDateValue && endDateValue) {
      const startDate = new Date(startDateValue);
      const endDate = new Date(endDateValue);
      const numberOfDays = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24));
      const totalPrice = officePrice * numberOfDays;
      const total = totalPrice + cleaningFee;

      document.getElementById("total-days").innerText = numberOfDays;
      document.getElementById("total-price-dates").innerText = totalPrice.toFixed(2); // Format price to two decimal places
      document.getElementById("total").innerText = total.toFixed(2);
    } else {
      document.getElementById("total-days").innerText = "0";
      document.getElementById("total-price-dates").innerText = "0.00"; // Initial value
      document.getElementById("total").innerText = cleaningFee.toFixed(2); // Display cleaning fee as initial total
    }
  }
}
