require 'rails_helper'

RSpec.describe Api::V1::Account::SessionsController, type: :controller do
  let(:user) { build(:user) }

  describe "POST create" do
    it "has a 422 status code if no params" do
      post :create
      expect(response.status).to eq(422)
    end

    it "has a 200 status code if correct params" do
      user.save
      post :create, { user: {
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation
      }, format: :json}
      expect(response.status).to eq(200)
    end
  end
end