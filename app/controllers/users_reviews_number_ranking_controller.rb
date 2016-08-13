class UsersReviewsNumberRankingController < ApplicationController

  def index
    user_ids = Review.group(:user_id).order('count_user_id DESC').count(:user_id).keys
    @users = user_ids.map { |id| User.find(id) }
  end

end
