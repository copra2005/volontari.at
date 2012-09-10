class Vendors::SimpleNavigation::Renderer::TwitterSidenav < SimpleNavigation::Renderer::Base
  def render(item_container)
    content = ''
      
    item_container.items.each do |item|
      selected = item.selected? && item.method.blank?
      klass = selected ? 'active' : ''
      options = {}
     
      if item.method.present?
        options.merge!(method: item.method, confirm: I18n.t('general.questions.are_you_sure'))
      end
      
      content += content_tag :li, link_to(item.name, item.url, options), class: klass
    end

    ul = content_tag :ul, content, class: 'nav nav-list'

    content_tag :div, ul, class: 'well sidebar-nav'
  end
end