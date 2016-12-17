require 'rails_helper'

RSpec.describe ToolsController, type: :controller do

  login_user

  describe 'GET#index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
