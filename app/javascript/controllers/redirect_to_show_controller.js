import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="redirect-to-show"
export default class extends Controller {

  navigate(event) {
    console.log("Card clicked");

    const url = event.currentTarget.dataset.url;
      console.log(url);
    window.location.href = url;
  }
}
