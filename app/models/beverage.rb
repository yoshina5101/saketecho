class Beverage < ApplicationRecord
  belongs_to :category

  has_many :tasting_logs, dependent: :destroy
  has_many :users, through: :tasting_logs

end
