require 'rails_helper'

RSpec.describe "Camppostsearches", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/camppostsearches/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/camppostsearches/search"
      expect(response).to have_http_status(:success)
    end
  end

end
