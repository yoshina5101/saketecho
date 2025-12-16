class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beverage, only: %i[create destroy]

  def index
    @beverages = current_user.favorite_beverages.includes(:category)
  end

  def create
    current_user.favorites.find_or_create_by!(beverage: @beverage)
    redirect_back fallback_location: beverages_path, notice: "お気に入りに追加しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(beverage: @beverage)
    favorite&.destroy
    redirect_back fallback_location: beverages_path, notice: "お気に入りを解除しました"
  end

  private

  def set_beverage
    @beverage = Beverage.find(params[:beverage_id])
  end
end
