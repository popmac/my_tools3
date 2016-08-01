class ToolsController < ApplicationController
  autocomplete :tool, :name, :full => true
end
