module TestCapybaraHelper
  def select2(value = nil, from: nil)
    find(:label, text: from).click
    find('.select2-container--focus').click
    find('.select2-results__option', text: value, match: :first).click
  end

  def check_label(locator = nil)
    checkbox = find(:checkbox, locator, visible: false)
    checkbox.ancestor(:label).click unless checkbox.checked?
  end

  def uncheck_label(locator = nil)
    checkbox = find(:checkbox, locator, visible: false)
    checkbox.ancestor(:label).click if checkbox.checked?
  end
end
