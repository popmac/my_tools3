class CommentsController < ApplicationController

  def index
    @comments = current_user.comments.includes({review: [user: :profile]}, {review: :tool})
    @uniq_comments = @comments.select(:review_id).uniq
  end

  def create
    @review = Review.find(params[:review_id])
    Comment.create(comment_params)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @review = Review.find(params[:review_id])
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @review = Review.find(params[:review_id])
    comment = Comment.find(params[:id])
    comment.update(update_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(review_id: @review.id, user_id: current_user.id)
  end

  def update_params
    params.require(:comment).permit(:comment).merge(review_id: @review.id, user_id: current_user.id)
  end

end
