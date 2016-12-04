require 'test_helper'

class ToolsControllerTest < ActionController::TestCase

  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:hoge1)
    sign_in(@user)
  end

  test "should get tools" do
    get :index
    assert_response :success
  end

end
