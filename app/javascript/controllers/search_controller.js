import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  static targets = ["input"];

  connect() {

}

  focus(event) {
    event.target.parentElement.parentElement.classList.add('active');
  }

  focusOut(event) {
    event.target.parentElement.parentElement.classList.remove('active');
  }

  blur(event) {
    if (event.target.value) {
      event.target.setAttribute('filled', 'true');
    } else {
      event.target.setAttribute('filled', 'false');
    }
  }


}
