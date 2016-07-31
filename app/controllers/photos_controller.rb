class PhotosController < ApplicationController

  def index
    @photos = current_user.photos
    @user = User.find(params[:user_id])
    unless current_user == @user
      redirect_to "/users/#{current_user.id}/photos"
    end
    if @photos.blank?
      redirect_to new_user_photo_path(current_user)
    end
  end

  def new
    @user = current_user
    @photo = Photo.new
    unless current_user.id == params[:user_id].to_i
      redirect_to "/users/#{current_user.id}/photos/new"
    end
  end

  def create
    if photo_params.present?
      photo_params.each_value do |image|
        current_user.photos.create(image: image)
      end
      redirect_to :root
      flash[:notice] = "#{photo_params.length}枚のスクリーンショットを投稿しました"
    else
      redirect_to new_user_photo_path(current_user)
      flash[:notice] = "1枚以上を投稿してください"
    end
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
