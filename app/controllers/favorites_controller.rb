class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_beverage

  def create
    current_user.favorites.find_or_create_by!(beverage: @beverage)
    redirect_back fallback_location: beverages_path, notice: "お気に入りに追加しました"
  rescue ActiveRecord::RecordInvalid
    redirect_back fallback_location: beverages_path, alert: "お気に入りに追加できませんでした"
  end

  private

  def set_beverage
    @beverage = Beverage.find(params[:beverage_id])
  end
end
