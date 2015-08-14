class PostsController < ApplicationController
  def create
    load_profile
    build_post
    save_post
  end
 
  def load_profile
    @profile = Profile.find(params[:profile_id])
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def build_post
    @post ||= Post.new(post_params)
    @post.wall_id = params[:profile_id] 
    @post.profile_id =  current_profile.id
  end

  def save_post
    if @post.save
      redirect_to :back
    else
    end
  end


  def post_params
    post_params = params[:post]
    post_params ? post_params.permit(:body, :created_at) : {}
  end



end