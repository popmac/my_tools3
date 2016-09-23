class ToolsReviewsNumberRankingController < ApplicationController
  def index
    tool_ids = Review.group(:tool_id).order('count_tool_id DESC').count(:tool_id).keys
    @tools = tool_ids.map { |id| Tool.find(id) }
  end
end
