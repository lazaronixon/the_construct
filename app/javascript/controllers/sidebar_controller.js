import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    if (this.activeMenuItem && this.activeSubMenuItem) {
      this.activeSubMenuItem.style.display = "block"
    }
  }

  // Private

  get activeMenuItem() {
    return this.element.querySelector("li.active")
  }

  get activeSubMenuItem() {
    return this.activeMenuItem.closest(".dropdown-menu")
  }

}
