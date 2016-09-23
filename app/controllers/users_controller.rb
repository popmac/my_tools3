class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    # profileが登録されている場合は以下のインスタンスを生成
    unless current_user.profile.avatar == nil || current_user.profile.nickname == nil || current_user.profile.age == nil || current_user.profile.job == nil || current_user.profile.introduce == nil
      # 自分が一番上に表示されるようにしている
      @users = [current_user, *User.where.not(id: current_user.id).includes(:profile).to_a]
      @introduce = current_user.profile.introduce
      @photos = current_user.photos
      @reviews = current_user.reviews.includes(:tool)
    end
  end

  def show
    # profileが登録されていない場合はusers/indexにリダイレクト
    if current_user.profile.avatar == nil || current_user.profile.nickname == nil || current_user.profile.age == nil || current_user.profile.job == nil || current_user.profile.introduce == nil
      redirect_to controller: :users, action: :index
      return
    end
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
