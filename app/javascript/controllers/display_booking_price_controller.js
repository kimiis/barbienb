import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-booking-price"
export default class extends Controller {

  static targets = ["arrivalDate", "departureDate", "totalPrice"];

  calculateTotalPrice() {
    const arrivalDateValue = this.arrivalDateTarget.value;
    const departureDateValue = this.departureDateTarget.value;

    // Vérifie si les dates sont valides
    if (!arrivalDateValue || !departureDateValue) {
        this.totalPriceTarget.textContent = '0 €';
        return;
    }

    const arrivalDate = new Date(arrivalDateValue);
    const departureDate = new Date(departureDateValue);

    // Vérifie si la date de départ est postérieure à la date d'arrivée
    if (departureDate <= arrivalDate) {
        this.totalPriceTarget.textContent = '0 €';
        return;
    }

    const timeDiff = departureDate - arrivalDate;
    const millisecondsPerDay = 1000 * 60 * 60 * 24;
    const nights = timeDiff / millisecondsPerDay;

    const pricePerNight = parseFloat(this.totalPriceTarget.dataset.pricePerNight);
    if (isNaN(pricePerNight)) {
        this.totalPriceTarget.textContent = 'Prix par nuit invalide.';
        return;
    }

    const totalPrice = nights * pricePerNight;

    this.totalPriceTarget.innerHTML = totalPrice + " €";
  }

}
