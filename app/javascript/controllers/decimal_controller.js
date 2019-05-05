import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    new Cleave(this.element, {
      numeral: true,
      numeralThousandsGroupStyle: "none"
    })
  }

}
