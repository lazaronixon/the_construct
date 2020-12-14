import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.element.placeholder = "YYYY/MM/DD"
    new Cleave(this.element, { date: true, datePattern: ["Y", "m", "d"] })
  }

}
