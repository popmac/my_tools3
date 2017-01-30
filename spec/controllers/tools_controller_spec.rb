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

    before { get :new }

    it "assigns a new Tool to @tool" do
      expect(assigns(:tool)).to be_a_new(Tool)
    end
    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'POST#create' do

    before do
      @review = attributes_for(:review)
      @no_review = attributes_for(:review, review: nil)
      @no_rate = attributes_for(:review, rate: nil)
      @no_review_and_rate = attributes_for(:review, review: nil, rate: :nil)
    end

    context 'with valid attributes' do
      it 'saves the new tool in the database' do
        expect{
          post :create, tool: attributes_for(:tool, review: @review)
        }.to change(Tool, :count).by(1)
      end
      it "redirects to root" do
        post :create, tool: attributes_for(:tool, review: @review)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it "does not save the new tool in the database" do
        expect{
          post :create, tool: attributes_for(:invalid_tool)
        }.to_not change(Tool, :count)
      end
      it "re-renders the :new template" do
        post :create, tool: attributes_for(:invalid_tool)
        expect(response).to render_template :new
      end
    end

    context 'paramsのreviewの中にreviewが存在しない場合' do
      it "does not save the new tool in the database" do
        expect{
          post :create, tool: attributes_for(:tool, review: @no_review)
        }.to_not change(Tool, :count)
      end
    end

    context 'paramsのreviewの中にrateが存在しない場合' do
      it "does not save the new tool in the database" do
        expect{
          post :create, tool: attributes_for(:tool, review: @no_rate)
        }.to_not change(Tool, :count)
      end
    end

    context 'paramsのreviewの中にreviewとrateが存在しない場合' do
      it "does not save the new tool in the database" do
        expect{
          post :create, tool: attributes_for(:tool, review: @no_review_and_rate)
        }.to_not change(Tool, :count)
      end
    end

  end

  describe 'GET#show' do

    before do
      @tool = create(:tool)
      get :show, id: @tool
    end

    it "assigns the requested tool to @tool" do
      expect(assigns(:tool)).to eq @tool
    end
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

end
