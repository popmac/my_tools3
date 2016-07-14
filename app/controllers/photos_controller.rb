class PhotosController < ApplicationController

  def index
    @photos = current_user.photos
  end

  def new
    @user = current_user
    @photo = Photo.new
  end

  def create
    photo_params.each_value do |image|
      current_user.photos.create(image: image)
    end
    redirect_to :root
    flash[:notice] = "スクリーンショットを投稿しました"
  end

  def destroy
    photo = Photo.find(params[:id])
    if photo.user.id == current_user.id
      photo.destroy
    end
    redirect_to action: :index
    flash[:notice] = "スクリーンショットを削除しました"
  end

  private
  def photo_params
    params.require(:photo).require(:image)
  end

end
