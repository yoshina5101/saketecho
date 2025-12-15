class BeveragesController < ApplicationController
  def index
    @beverages = Beverage.includes(:category).order(created_at: :desc)
  end

  def show
    @beverage = Beverage.find(params[:id])
  end
end
