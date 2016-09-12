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
    # users/showで表示の対象となるuserを設定
    @active_user = User.find(params[:id])
    @users = [@active_user, *User.where.not(id: @active_user.id).includes(:profile).to_a]
    # users/show.jsでajaxを使うために設定
    @user = User.find(params[:id])
    @introduce = @user.profile.introduce
    @photos = @user.photos
    @reviews = @user.reviews.includes(:tool)
  end
end
