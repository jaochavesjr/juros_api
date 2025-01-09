require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { User.create(name: "Test User", email: "test@example.com", password: "password") }

  describe "POST #login" do
    context "with valid credentials" do
      it "returns a JWT token" do
        post :login, params: { email: user.email, password: "password" }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key("token")
      end
    end

    context "with invalid credentials" do
      it "returns an unauthorized status" do
        post :login, params: { email: user.email, password: "wrongpassword" }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
