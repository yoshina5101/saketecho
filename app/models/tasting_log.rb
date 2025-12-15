class TastingLog < ApplicationRecord
  belongs_to :user
  belongs_to :beverage

  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
end
