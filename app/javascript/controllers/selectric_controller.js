import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $(this.element).selectric({
      disableOnMobile: false,
      nativeOnMobile: false
    })
  }
}
