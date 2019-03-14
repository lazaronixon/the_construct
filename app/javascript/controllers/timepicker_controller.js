import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).timepicker({
      icons: {
        up: 'fas fa-chevron-up',
        down: 'fas fa-chevron-down'
      }
    })
  }
}
