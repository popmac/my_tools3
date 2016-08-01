class ToolsController < ApplicationController
  autocomplete :tool, :name, :full => true

  def new
    @tool = Tool.new
    @tool.reviews.build
  end

  def create
    @tool = Tool.where(name: params[:tool][:name]).first_or_initialize
    if @tool.name.present?
      @tool.save
    else
      render 'new'
      flash[:notice] = "アプリとレビューを両方とも入力してください"
      return
    end
    @review = Review.new(review_params)
    if @review.review.present?
      @review.save
      redirect_to users_path
      flash[:notice] = "アプリとレビューを登録しました"
      return
    else
      @tool.destroy
      render 'new'
      flash[:notice] = "アプリとレビューを両方とも入力してください"
    end
  end

  private
  def review_params
    params.require(:tool).require(:review).permit(:review).merge(user_id: current_user.id, tool_id: @tool.id)
  end

end
