class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    unless  current_user.profile.id == @profile.id
      redirect_to "/profiles/#{current_user.profile.id}"
    end
    if @profile.age == nil || @profile.job == nil || @profile.comment == nil
      redirect_to "/profiles/#{current_user.profile.id}/edit"
      flash[:notice] = "プロフィールを入力してください"
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    unless  current_user.profile.id == @profile.id
      redirect_to "/profiles/#{current_user.profile.id}/edit"
    end
  end

  def update
    profile = Profile.find(params[:id])
    if profile.user.id == current_user.id
      profile.update(update_params)
    end
    redirect_to action: :show
    flash[:notice] = "プロフィールを編集しました"
  end

  private
  def update_params
    params.require(:profile).permit(:age, :job, :comment).merge(user_id: current_user.id)
  end

end
