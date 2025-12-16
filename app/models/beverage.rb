class Beverage < ApplicationRecord
  belongs_to :category

  has_many :tasting_logs, dependent: :destroy
  has_many :users, through: :tasting_logs
  has_many :favorites, dependent: :destroy
  has_many :beverage_moods, dependent: :destroy
has_many :moods, through: :beverage_moods

end
