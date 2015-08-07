class AfterRegisterController < ApplicationController
  include Wicked::Wizard
  steps :welcome, :personal, :contact, :info, :rules
  before_filter :authenticate_user!

  def show
    @profile = current_user.profile
    case step
    when :personal
      #set_facebook_data session['devise.facebook_info']
    end
    render_wizard
    if step == 'wicked_finish'
      @profile.update(status: 'active')
    else
      @profile.update(status: step.to_s)
    end
  end

  def update
    @profile = current_user.profile
    params[:profile][:status] = step.to_s if params[:profile].present?
    #params[:profile][:status] = 'active' if params[:profile].present? && step == steps.last 
    if params[:back_button]
      if @profile.update(profile_params)
        redirect_to previous_wizard_path
      else
        render_wizard
      end
    else
      @profile.update(profile_params)
      render_wizard @profile
    end

  end

  private

    def redirect_to_finish_wizard(options = nil)
      redirect_to root_path
    end

    def profile_params
      #params[:brother][:remote_profile_photo_url] = nil if params[:brother][:profile_photo].present?
      params.fetch(:profile, {}).permit(:first_name, :birthday, :avatar, :last_name, :status, :terms_of_service, :city, :terms_of_service,
                                   :profile_photo)
    end
end

