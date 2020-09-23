class ProductCategory < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
end
