class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to :root
  end

  private
  def photo_params
    params.require(:photo).permit(:image).merge(user_id: current_user.id)
  end

end
