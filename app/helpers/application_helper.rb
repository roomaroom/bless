module ApplicationHelper
  def icon(css_class, options = {})
    options[:class] = css_class
    content_tag(:i, '', options)
  end

  def current_profile
    current_user.profile
  end

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end
end
