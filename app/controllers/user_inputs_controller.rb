class UserInputsController < ApplicationController
  before_action :set_user_input

  def destroy
    @user_input.destroy
  end

  def translate; end

  private

  def set_user_input
    @user_input = UserInput.find(params[:id])
  end
end
