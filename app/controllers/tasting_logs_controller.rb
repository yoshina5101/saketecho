class TastingLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tasting_log, only: %i[show destroy]

  def index
    @tasting_logs = current_user.tasting_logs.includes(:beverage).order(created_at: :desc)
  end

  def new
    @tasting_log = current_user.tasting_logs.new
  end

  def create
    @tasting_log = current_user.tasting_logs.new(tasting_log_params)
    if @tasting_log.save
      redirect_to @tasting_log, notice: "記録を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @tasting_log.destroy!
    redirect_to tasting_logs_path, notice: "記録を削除しました"
  end

  private

  def set_tasting_log
    @tasting_log = current_user.tasting_logs.find(params[:id]) # 他人の記録は見れない
  end

  def tasting_log_params
    params.require(:tasting_log).permit(:beverage_id, :tasted_on, :rating, :comment)
  end
end
