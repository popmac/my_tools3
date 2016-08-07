class CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    Comment.create(comment_params)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    @review = Review.find(params[:review_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(review_id: @review.id, user_id: current_user.id)
  end

end
