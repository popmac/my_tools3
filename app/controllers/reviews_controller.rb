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
    @temporary_review = current_user.reviews.where(tool_id: @tool.id)
    if @temporary_review != []
      redirect_to "/reviews/#{@temporary_review[0].id}/edit"
      flash[:error] = "すでに登録されているアプリのレビューです。内容を変更する場合はこちらの画面から編集してください。"
    end
  end

  def create
    Review.create(create_params)
    redirect_to "/tools/#{params[:tool_id]}"
  end

  def show
    @review = Review.find(params[:id])
    @posted_comments =  @review.comments.includes({user: [:profile]})
    @comment = Comment.new
    @likes = @review.likes.includes({user: [:profile]})
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
    params.require(:review).permit(:review, :rate).merge(user_id: current_user.id, tool_id: params[:tool_id])
  end

  def update_params
    params.require(:review).permit(:review, :rate).merge(user_id: current_user.id, tool_id: @tool_id)
  end

end
