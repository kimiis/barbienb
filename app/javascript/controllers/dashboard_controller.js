import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["housesContainer", "bookingsContainer", "bookingsBtn", "housesBtn"]
  connect() {
    console.log("coucou");
  }
  setActiveBookings() {
    this.housesContainerTarget.classList.remove("show")
    this.bookingsContainerTarget.classList.add("show")
    this.bookingsBtnTarget.classList.add("active")
    this.housesBtnTarget.classList.remove("active")
  }
  setActiveHouses() {
    this.housesContainerTarget.classList.add("show")
    this.bookingsContainerTarget.classList.remove("show")
    this.housesBtnTarget.classList.add("active")
    this.bookingsBtnTarget.classList.remove("active")
  }
}
