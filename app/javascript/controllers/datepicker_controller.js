import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    
    flatpickr(this.element, {
      // permet de choisir une date dans un seul calendrier
      mode: "range",

    });
  }
}
