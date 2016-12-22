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

  describe 'GET#show' do
    it "assigns the requested tool to @tool" do
      tool = create(:tool)
      get :show, id: tool
      expect(assigns(:tool)).to eq tool
    end
    it "renders the :show template" do
      tool = create(:tool)
      get :show, id: tool
      expect(response).to render_template :show
    end
  end

end
