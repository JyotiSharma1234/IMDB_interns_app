require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #indx" do
    it "returns http success" do
      get :indx
      expect(response).to have_http_status(:success)
    end
  end

end
