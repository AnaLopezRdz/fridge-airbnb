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
              enabledDates: [
                {
                    from: document.getElementById("startDate1").innerText,
                    to: document.getElementById("endDate1").innerText
                }],
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#end_date"})]})
    flatpickr(this.endDateTarget, {})
  }
}
