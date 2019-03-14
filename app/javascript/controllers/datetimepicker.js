import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).daterangepicker({
      locale: {format: 'YYYY-MM-DD hh:mm'},
      singleDatePicker: true,
      timePicker: true,
      timePicker24Hour: true,
    });
  }
}
