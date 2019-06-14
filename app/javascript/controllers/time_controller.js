import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    $(this.element).timepicker({
      defaultTime: "",
      minuteStep: 1,
      showSeconds: true,
      showMeridian: false,
      snapToStep: true,
      icons: this.icons
    })
  }

  // Private

  get icons() {
    return {
      up: 'fas fa-chevron-up',
      down: 'fas fa-chevron-down'
    }
  }

}
