class ActivitiesController < ApplicationController
  def create
    load_profile
    build_activity
    save_activity
  end

  def load_profile
    @profile = Profile.find(params[:profile_id])
  end

  def build_activity
    @activity ||= Activity.new(activity_params)
    @activity.owner_id = current_profile.id
    @activity.profile_id =  params[:profile_id]
  end

  def save_activity
    if @activity.save
      redirect_to :back
    else
    end
  end


  def activity_params
    activity_params = params[:activity]
    activity_params ? activity_params.permit(:body, :created_at) : {}
  end
end