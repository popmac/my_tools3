class ToolsAllController < ApplicationController
  def index
    @tools = Tool.all
  end
end
