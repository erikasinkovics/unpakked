class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :stores

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :first_name, :last_name, :address, :city, :postal_code, presence: true
end
