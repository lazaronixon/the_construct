import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    const FORMAT = "YYYY/MM/DD hh:mm"

    $(this.element).daterangepicker({
      locale: { format: FORMAT },
      singleDatePicker: true,
      timePicker: true,
      timePicker24Hour: true,
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
