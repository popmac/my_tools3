class UsersReviewsSumLikesCountRankingController < ApplicationController
  def index
    user_ids = Review.group(:user_id).order('sum_likes_count DESC').sum(:likes_count).keys
    @users = user_ids.map { |id| User.find(id) }
  end
end
