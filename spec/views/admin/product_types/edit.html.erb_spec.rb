require 'rails_helper'

RSpec.describe "admin/product_types/edit", type: :view do
  before(:each) do
    @admin_product_type = assign(:admin_product_type, ProductType.create!())
  end

  it "renders the edit admin_product_type form" do
    render

    assert_select "form[action=?][method=?]", admin_product_type_path(@admin_product_type), "post" do
    end
  end
end
