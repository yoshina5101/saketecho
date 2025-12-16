class Mood < ApplicationRecord
  has_many :beverage_moods, dependent: :destroy
  has_many :beverages, through: :beverage_moods

  validates :name, presence: true, uniqueness: true
end