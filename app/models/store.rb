class Store < ApplicationRecord
  belongs_to :user

  has_many :product_categories
  has_many :reviews

  validates :name, :address, :city, :postal_code, :status, presence: true
end
