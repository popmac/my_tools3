class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @comment = current_user.profile.comment
    @photos = current_user.photos
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @comment = @user.profile.comment
    @photos = @user.photos
  end
end
