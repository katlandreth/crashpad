module ControllerMacros

  def login_member
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      member = FactoryGirl.create(:member)
      sign_in member
    end
  end
end
