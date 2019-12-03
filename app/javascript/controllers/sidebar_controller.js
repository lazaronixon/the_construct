import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    if (this.activeDropDownItem) {
      this.activeDropDownMenu.style.display = "block"
      this.activeDropDown.classList.add("active")
    }
  }

// Private
  get activeDropDownItem() {
    return this.element.querySelector(".dropdown-menu > li.active")
  }

  get activeDropDownMenu() {
    return this.activeDropDownItem.closest(".dropdown-menu")
  }

  get activeDropDown() {
    return this.activeDropDownItem.closest(".dropdown")
  }

}
