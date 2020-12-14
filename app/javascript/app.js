import { onDocumentReady } from "helpers"

class App {

  bindDomContentLoaded() {
    onDocumentReady(() => { this.bindFormAjaxError() })
  }

  bindTurboLinksEvents() {
    document.addEventListener("turbolinks:load", () => {
      //Initialize plugins here
    })
    document.addEventListener("turbolinks:before-cache", () => {
      //Destroy plugins here
    })
  }

// Private
  bindFormAjaxError() {
    document.addEventListener("ajax:error", (e) => {
      if (e.target.matches("[data-remote='true']")) {
        iziToast.error({message: "Whoopps, something went wrong.", title: "Error", position: "topRight"})
      }
    })
  }
}

export function start() {
  const app = new App()
  app.bindDomContentLoaded()
  app.bindTurboLinksEvents()
}
