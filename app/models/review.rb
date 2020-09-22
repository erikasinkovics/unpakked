class Review < ApplicationRecord
  belongs_to :store
  belongs_to :user
end
