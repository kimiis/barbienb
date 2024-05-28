import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-booking-price"
export default class extends Controller {
  select_dates() {
    
    this.element.textContent = "Hello World!"
  }
}
