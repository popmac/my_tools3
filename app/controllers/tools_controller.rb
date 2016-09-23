class ToolsController < ApplicationController
  autocomplete :tool, :name, :full => true

  def index
    # reviewが多い順で並ぶようにしている
    tool_ids = Review.group(:tool_id).order('count_tool_id DESC').count(:tool_id).keys
    @tools = tool_ids.map { |id| Tool.find(id) }
  end

  def new
    @tool = Tool.new
    @tool.reviews.build
  end

  def create
    @tool = Tool.where(name: params[:tool][:name]).first_or_initialize
    @temporary_review = current_user.reviews.where(tool_id: @tool.id)
    if @temporary_review != [] && @temporary_review[0].tool_id == @tool.id
      redirect_to "/reviews/#{@temporary_review[0].id}/edit"
      flash[:error] = "すでに登録されているアプリのレビューです。内容を変更する場合はこちらの画面から編集してください。"
      return
    end
    if @tool.name.present? && params[:tool][:review][:review].present? && params[:tool][:review][:rate].present?
      @tool.save
      @review = Review.create(review_params)
      redirect_to root_path
      flash[:notice] = "アプリとレビューを登録しました"
      return
    else
      render 'new'
      flash[:notice] = "すべての情報を入力してください"
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @reviews = @tool.reviews.includes({user: [:profile]})
  end

  def search
    @tools = Tool.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  private
  def review_params
    params.require(:tool).require(:review).permit(:review, :rate).merge(user_id: current_user.id, tool_id: @tool.id)
  end

end
