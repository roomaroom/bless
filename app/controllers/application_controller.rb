class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_profile
  protect_from_forgery with: :exception

  before_filter :onboarding_complete

  def onboarding_complete
    return if current_user.nil?
    return if params[:controller] == 'after_register'
    unless current_user.profile.status == 'active'
      redirect_to after_register_path(current_user.profile.status)
    end
  end

  def current_profile
    current_user.profile
  end
end
