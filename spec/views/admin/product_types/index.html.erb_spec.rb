require 'rails_helper'

RSpec.describe "admin/product_types/index", type: :view do
  before(:each) do
    assign(:product_types, [
      ProductType.create!(),
      ProductType.create!()
    ])
  end

  it "renders a list of admin/product_types" do
    render
  end
end
