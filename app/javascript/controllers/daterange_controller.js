import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).daterangepicker({
      locale: {format: 'YYYY-MM-DD'},
      drops: 'down',
      opens: 'right'
    })
  }
}
