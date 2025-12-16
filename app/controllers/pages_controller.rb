class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[mypage]

  def home; end

  def mypage
    @user = current_user
  end
end
