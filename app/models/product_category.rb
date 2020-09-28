class ProductCategory < ApplicationRecord
  has_many :product_category_tags
  has_many :stores, through: :product_category_tags

  validates :name, presence: true, uniqueness: true
end
