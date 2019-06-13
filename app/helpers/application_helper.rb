module ApplicationHelper
  MOBILE_USER_AGENT = 'TheConstructMobile'

  def page_title
    content_for(:page_title) || Rails.application.class.to_s.split('::').first
  end

  def crud_actions
    %w[index show new edit create update]
  end

  def mobile_app?
    request.user_agent && request.user_agent.end_with?(MOBILE_USER_AGENT)
  end

  def active_nav_item(controller, actions)
    'active' if active_actions?(controller, actions)
  end

  def sort_link_turbo(attribute, *args)
    sort_link(attribute, *args.push({}, { data: { turbolinks_action: 'replace' } }))
  end

  def icon(klass, text = nil)
    icon_tag = tag.i(class: klass)
    text_tag = tag.span text
    text ? tag.span(icon_tag + text_tag) : icon_tag
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
