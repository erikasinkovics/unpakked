class Store < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  has_many :product_category_tags, dependent: :destroy
  has_many :product_categories, through: :product_category_tags
  has_many :reviews

  validates :name, :address, :city, :postal_code, presence: true
end
