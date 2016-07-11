class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    if profile.user.id == current_user.id
      profile.update(update_params)
    end
    redirect_to action: :show
  end

  private
  def profile_params
    params.require(:profile).permit(:age, :job, :comment).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:profile).permit(:age, :job, :comment).merge(user_id: current_user.id)
  end

end
