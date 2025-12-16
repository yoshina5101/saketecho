class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beverage

  validates :user_id, uniqueness: { scope: :beverage_id }
end
