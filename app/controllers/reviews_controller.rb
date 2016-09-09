class ReviewsController < ApplicationController

  def index
    @reviews = current_user.reviews.includes(:tool)
    if @reviews.blank?
      redirect_to controller: :tools, action: :new
      flash[:notice] = "レビューを投稿してください"
    end
  end

  def new
    @review = Review.new
    @tool = Tool.find(params[:tool_id])
  end

  def create
    Review.create(create_params)
    redirect_to "/tools/#{params[:tool_id]}"
  end

  def show
    @review = Review.find(params[:id])
    @posted_comments =  @review.comments.includes({user: [:profile]})
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user.id == current_user.id
      redirect_to controller: :users, action: :index
    end
  end

  def update
    review = Review.find(params[:id])
    @tool_id = review.tool.id
    if review.user.id == current_user.id
      review.update(update_params)
      redirect_to root_path
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to controller: :users, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, tool_id: params[:tool_id])
  end

  def update_params
    params.require(:review).permit(:review).merge(user_id: current_user.id, tool_id: @tool_id)
  end

end
