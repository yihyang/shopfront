require 'rails_helper'

RSpec.describe "admin/product_types/show", type: :view do
  before(:each) do
    @admin_product_type = assign(:admin_product_type, ProductType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
