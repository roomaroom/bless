class ActivitiesController < ApplicationController
  def create
    load_profile
    build_activity
    save_activity
  end

  def like
    load_activity
    current_profile.like!(@activity)
    redirect_to :back
  end

  def unlike
    load_activity
    current_profile.unlike!(@activity)
    redirect_to :back
  end

  def shared
    load_activity
    Share.create(shared_profile_id: params[:profile_id], shared_activity_id: params[:id])
    Activity.create(wall_id: current_profile.id, profile_id: params[:profile_id], item: @activity.item, shared: true)
    redirect_to :back
  end
 
  def load_profile
    @profile = Profile.find(params[:profile_id])
  end

  def load_activity
    @activity = Activity.find(params[:id])
  end

  def build_activity
    @activity ||= Activity.new(activity_params)
    @activity.wall_id = current_profile.id
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