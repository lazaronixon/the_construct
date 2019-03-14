import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.element.addEventListener("ajax:beforeSend", function(event) {
      const detail = event.detail, xhr = detail[0], options = detail[1]

      Turbolinks.visit(options.url, { action: "replace" })
      event.preventDefault()
    })
  }

}
