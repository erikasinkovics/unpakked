class ProductCategoryTag < ApplicationRecord
  belongs_to :store
  belongs_to :product_category

  validates :store, :product_category, presence: true
end
