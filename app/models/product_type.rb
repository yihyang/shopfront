class ProductType < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
