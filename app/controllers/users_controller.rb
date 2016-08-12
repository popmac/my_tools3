class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @introduce = current_user.profile.introduce
    @photos = current_user.photos
    @reviews = current_user.reviews
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @introduce = @user.profile.introduce
    @photos = @user.photos
    @reviews = @user.reviews
  end
end
