class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    photo_params.each_value do |image|
      photo = current_user.photos.create(image: image)
    end
    redirect_to :root
  end

  private
  def photo_params
    params.require(:photo).require(:image)
  end

end
