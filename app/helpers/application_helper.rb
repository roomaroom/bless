module ApplicationHelper
  def icon(css_class, options = {})
    options[:class] = css_class
    content_tag(:i, '', options)
  end

  def current_profile
    current_user.profile
  end
end
