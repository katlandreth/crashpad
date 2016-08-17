require 'rails_helper'

RSpec.describe HostRolesController, type: :controller do

  describe "GETing the #new action" do
    login_member
    it "returns http success" do
      get :new, format: 'json'
      expect(response).to have_http_status(:success)
    end
  end

end
