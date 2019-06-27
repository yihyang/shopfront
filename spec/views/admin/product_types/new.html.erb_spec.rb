require 'rails_helper'

RSpec.describe "admin/product_types/new", type: :view do
  before(:each) do
    assign(:admin_product_type, ProductType.new())
  end

  it "renders new admin_product_type form" do
    render

    assert_select "form[action=?][method=?]", admin_product_types_path, "post" do
    end
  end
end
