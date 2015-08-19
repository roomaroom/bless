module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    Profile.all.each do |profile|
      s << "<option value='#{profile.id}'>#{profile.full_name}</option>"
    end
    s.html_safe
  end
end