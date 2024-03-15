class DashboardController < ApplicationController
  def index
    @user_inputs = current_user.user_inputs
  end

  def today
    @user_inputs = current_user.user_inputs.today
    render :index
  end

  def yesterday
    @user_inputs = current_user.user_inputs.yesterday
    render :index
  end
end
