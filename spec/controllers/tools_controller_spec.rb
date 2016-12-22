require 'rails_helper'

RSpec.describe ToolsController, type: :controller do

  login_user

  describe 'GET#index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET#new' do
    it "assigns a new Tool to @tool" do
      get :new
      expect(assigns(:tool)).to be_a_new(Tool)
    end
    # :new テンプレートを表示すること
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

end
