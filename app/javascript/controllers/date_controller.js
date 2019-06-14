import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    const FORMAT = "YYYY/MM/DD"

    $(this.element).daterangepicker({
      locale: { format: FORMAT },
      singleDatePicker: true,
      autoUpdateInput: false
    })

    $(this.element).on("apply.daterangepicker", function(ev, picker) {
      $(this).val(picker.startDate.format(FORMAT))
    })

    $(this.element).on("cancel.daterangepicker", function(ev, picker) {
      $(this).val("")
    })
  }

}
