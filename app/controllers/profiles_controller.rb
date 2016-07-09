class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    redirect_to :root
  end

  private
  def profile_params
    params.require(:profile).permit(:age, :job, :comment).merge(user_id: current_user.id)
  end

end
