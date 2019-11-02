module ApplicationHelper
  def page_title
    content_for(:page_title) || Rails.application.class.to_s.split('::').first
  end

  def crud_actions
    %w[index show new edit create update]
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

  def localize(object, options = {})
    super(object, options) if object
  end

  alias :np, :number_with_precision

  alias :nd, :number_with_delimiter

  alias :l :localize

  private
    def active_actions?(controller, actions)
      controller == params[:controller] && actions.include?(params[:action])
    end
end
