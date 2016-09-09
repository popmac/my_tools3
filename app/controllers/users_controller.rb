class UsersController < ApplicationController

  def index
    # 自分が一番上に表示されるようにしている
    @users = [current_user, *User.where.not(id: current_user.id).includes(:profile).to_a]
    @user = User.find(current_user.id)
    @introduce = current_user.profile.introduce
    @photos = current_user.photos
    @reviews = current_user.reviews.includes(:tool)
  end

  def show
    @users = User.all.includes(:profile)
    @user = User.find(params[:id])
    @active_user = User.find(params[:id])
    @introduce = @user.profile.introduce
    @photos = @user.photos
    @reviews = @user.reviews.includes(:tool)
  end
end
