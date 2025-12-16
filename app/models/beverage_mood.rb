class BeverageMood < ApplicationRecord
  belongs_to :beverage
  belongs_to :mood

  validates :beverage_id, uniqueness: { scope: :mood_id }
end
