class MoodsController < ApplicationController
  def index
    @moods = Mood.order(:name)
  end

  def show
    @mood = Mood.find(params[:id])
    @beverages = @mood.beverages.includes(:category)
  end
end
