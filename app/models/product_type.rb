class ProductType < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
