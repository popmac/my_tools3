module ControllerMacros
  def login_user
    before(:each) do
      allow(controller).to receive(:authenticate_user!).and_return true
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user) do |u|
        u.profile.update(FactoryGirl.attributes_for(:profile))
      end
      sign_in user
    end
  end
end
