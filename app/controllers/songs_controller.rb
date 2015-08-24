class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    #binding.pry
    @song = Song.create(song_params)
    redirect_to :back
  end

  private

  def song_params
    params.require(:song).permit(:audio, :name)
  end
end
