class Store < ApplicationRecord
  belongs_to :user

  has_many :product_category_tags, dependent: :destroy
  has_many :product_categories, through: :product_category_tags
  has_many :reviews

  validates :name, :address, :city, :postal_code, :status, presence: true, uniqueness: true
end
