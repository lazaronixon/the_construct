import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).submit(function() {
      var form = $(this);
      if (form[0].checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.addClass('was-validated');
    })
  }
}
