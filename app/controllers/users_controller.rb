class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @comment = @user.profile.comment
    @photos = @user.photos
  end

  def show
    @user = User.find(params[:id])
    @comment = @user.profile.comment
  end
end
