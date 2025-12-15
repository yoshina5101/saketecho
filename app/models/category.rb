class Category < ApplicationRecord
  has_many :beverages, dependent: :destroy
end