require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  require 'rails_helper'

RSpec.describe "Users API", type: :request do
  let!(:user) { create(:user) }
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe "GET /users" do
    context "when the user is not logged in" do
      it "returns a 401 Unauthorized response" do
        get "/users", headers: headers
        expect(response).to have_http_status(401)
      end
    end

    context "when the user is logged in" do
      before do
        post "/login", params: { email: user.email, password: user.password }.to_json, headers: headers
      end

      it "returns a list of users" do
        get "/users", headers: headers
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).length).to eq(1)
      end
    end
  end

  describe "GET /users/:id" do
    context "when the user is not logged in" do
      it "returns a 401 Unauthorized response" do
        get "/users/#{user.id}", headers: headers
        expect(response).to have_http_status(401)
      end
    end

    context "when the user is logged in" do
      before do
        post "/login", params: { email: user.email, password: user.password }.to_json, headers: headers
      end

      it "returns the user with the given ID" do
        get "/users/#{user.id}", headers: headers
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)["id"]).to eq(user.id)
      end
    end
  end

  # similar tests for creating, updating, and deleting users
end

end
