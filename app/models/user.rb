class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasting_logs, dependent: :destroy
  has_many :beverages, through: :tasting_logs
  has_many :favorites, dependent: :destroy
  has_many :favorite_beverages, through: :favorites, source: :beverage

end
