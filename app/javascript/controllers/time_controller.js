import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.element.placeholder = "hh:mm:ss"
    new Cleave(this.element, { time: true, timePattern: ["h", "m", "s"] })
  }

}
