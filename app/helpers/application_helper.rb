module ApplicationHelper
  def page_title
    content_for(:page_title) || Rails.application.class.to_s.split('::').first
  end

  def active_nav_item(controller, actions)
    'active' if active_actions?(controller, actions)
  end

  def table_actions(resource, options = {})
    output  = link_to tag.i(class: 'fas fa-eye'), resource, title: 'Show it', class: 'btn btn-icon btn-sm btn-info mr-1'
    output += link_to tag.i(class: 'fas fa-edit'), edit_polymorphic_path(resource), title: 'Edit it', class: 'btn btn-icon btn-sm btn-warning mr-1'
    output += link_to tag.i(class: 'fas fa-trash'), resource, title: 'Destroy it', class: 'btn btn-icon btn-sm btn-danger', method: :delete, data: { confirm: 'Are you sure?', remote: options[:remote] || true }
  end

  def sort_link_turbo(attribute, *args)
    sort_link(attribute, *args.push({}, { data: { turbolinks_action: 'replace' } }))
  end

  def faicon(name, text = nil, style = 'fas')
    html_i = tag.i nil, class: "#{style} fa-#{name.to_s.tr('_', '-')}"
    html_text = tag.span text
    text ? tag.span(html_i + html_text) : html_i
  end

  def infinite_link_to(path, last_page)
    link_to "Next page", path, class: 'infinite-more-link' unless last_page
  end

  def n(number, precision = 2, options = {})
    options[:precision] = precision
    number_with_precision(number, options)
  end

  def l(object, options = {})
    super(object, options) if object
  end

  private
    def active_actions?(controller, actions)
      controller == params[:controller] && actions.include?(params[:action])
    end
end
