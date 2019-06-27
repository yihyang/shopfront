require 'rails_helper'

RSpec.describe "Admin::ProductTypes", type: :request do
  describe "GET /admin_product_types" do
    it "works! (now write some real specs)" do
      get admin_product_types_path
      expect(response).to have_http_status(200)
    end
  end
end
