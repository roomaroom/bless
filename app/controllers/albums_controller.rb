class AlbumsController < ApplicationController
  def index
    @albums = current_profile.albums
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

  def new
    @album = Album.new
  end

  def create
    #binding.pry
    @album = Album.create(album_params)
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :profile_id)
  end
end
