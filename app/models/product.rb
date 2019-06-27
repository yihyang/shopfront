class Product < ApplicationRecord
  belongs_to :product_type

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
