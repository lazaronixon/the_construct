module TestCapybaraHelper
  def select2(value, options = {})
    find(:label, text: options[:from]).click
    find('.select2-container--focus').click
    find('.select2-results__option', text: value).click
  end

  def check_label(locator = nil, **options)
    checkbox = find(:checkbox, locator, visible: false)
    checkbox.ancestor(:label).click unless checkbox.checked?
  end

  def uncheck_label(locator = nil, **options)
    checkbox = find(:checkbox, locator, visible: false)
    checkbox.ancestor(:label).click if checkbox.checked?
  end
end
