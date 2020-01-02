import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    this.element.remove()
    if (this.data.get("type") === "notice") {
      iziToast.success({message: this.data.get("message"), title: "Success", position: "topRight"})
    } else if (this.data.get("type") === "alert") {
      iziToast.error({message: this.data.get("message"), title: "Error", position: "topRight"})
    } else {
      iziToast.info({message: this.data.get("message"), title: "Info", position: "topRight"})
    }
  }

}
