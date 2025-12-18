class TastingLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tasting_log, only: %i[show edit update destroy]

  def index
    @tasting_logs = current_user.tasting_logs.includes(:beverage).order(created_at: :desc)
  end

  def new
    @tasting_log = current_user.tasting_logs.new
  end

  def create
    @tasting_log = current_user.tasting_logs.new(tasting_log_params)
    if @tasting_log.save
      redirect_to tasting_logs_path, notice: t("flash.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @tasting_log.update(tasting_log_params)
      redirect_to @tasting_log, notice: "飲酒記録を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @tasting_log.destroy!
    redirect_to tasting_logs_path, notice: t("flash.deleted")
  end

  private

  def set_tasting_log
    @tasting_log = current_user.tasting_logs.find(params[:id]) 
  end

  def tasting_log_params
    params.require(:tasting_log).permit(:beverage_id, :tasted_on, :rating, :comment)
  end
end
