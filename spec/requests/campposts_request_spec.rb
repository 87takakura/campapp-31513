require 'rails_helper'

RSpec.describe "Campposts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/campposts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/campposts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/campposts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/campposts/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
