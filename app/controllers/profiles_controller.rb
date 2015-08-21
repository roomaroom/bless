class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :update_quote]

  def index
    @profiles = Profile.where.not(id: current_profile).page(params[:page]).per(5)
  end

  def show
    #@profile = Profile.find(params[:id])
    @activities = @profile.wall_activities.order('created_at DESC')
    @post= Post.new 
    #@post_images = @post.post_images.build
    @photos = @post.photos.build
    #@photo = @post_images.build_photo
  end

  def edit
    @profile.photos.build if @profile.photos.empty?
    #@profile = Profile.find(params[:id])
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Museum was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_quote
    @profile.update_attribute(:quote, params[:quote])
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :avatar, :birthday, :last_name, :status, :terms_of_service, :city,
                                   photos_attributes: [:id, :image, :description])
    end
end
