class PhotosController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def new
    @painting = Painting.new
  end

  def create
    #binding.pry
    @photo = Photo.create(photo_params)
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
