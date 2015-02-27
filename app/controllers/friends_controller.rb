class FriendsController < ApplicationController
  def index
    @friends = current_profile.accepted_friends.map { |f| f.friend }
    #@friends = @friends1.page(params[:page]).per(5)
  end

  def create
    @friend = Friend.new(friend_id: params[:friend_id], profile_id: current_profile)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to :back, notice: 'You add a friend' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  def pending
    @friends = current_profile.pending_friends.map { |f| f.friend }
  end
  
  private
    def friend_params
      params.require(:friend).permit(:friend_id, :profile_id, :status)
    end
end
