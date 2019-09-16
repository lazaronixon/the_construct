import { Controller } from "stimulus"

export default class extends Controller {

  static targets = [ "container" ]

  connect() {
    new Waypoint.Infinite({
      element: this.containerTarget,
      items: "[data-target='infinite-page.item']",
      more: "a[data-target='infinite-page.more']",
      loadingClass: "loading",
    })
  }

}
