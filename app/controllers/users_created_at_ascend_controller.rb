class UsersCreatedAtAscendController < ApplicationController

  def index
    @users = User.all
  end
end
