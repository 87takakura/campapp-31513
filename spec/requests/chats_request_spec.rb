require 'rails_helper'

RSpec.describe "Chats", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/chats/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/chats/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/chats/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/chats/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
