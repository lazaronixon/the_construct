import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.element.placeholder = "YYYY/MM/DD hh:mm"
    new Cleave(this.element, { delimiters: ["/", "/", " ", ":"], blocks: [4, 2, 2, 2, 2] })
  }

}
