class ToolsController < ApplicationController
  autocomplete :tool, :name, :full => true

  def new
    @tool = Tool.new
    @tool.reviews.build
  end

  def create
    @tool = Tool.where(name: params[:tool][:name]).first_or_initialize
    if @tool.name.present? && params[:tool][:review][:review].present?
      @tool.save
      @review = Review.create(review_params)
      redirect_to root_path
      flash[:notice] = "アプリとレビューを登録しました"
      return
    else
      render 'new'
      flash[:notice] = "アプリとレビューを両方とも入力してください"
    end
  end

  private
  def review_params
    params.require(:tool).require(:review).permit(:review).merge(user_id: current_user.id, tool_id: @tool.id)
  end

end
