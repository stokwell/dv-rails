class Api::UserInputsController < ApplicationController
  skip_forgery_protection

  def index
    current_user.user_inputs
  end

  def create
    content = params[:user_input][:content]
    @user_input = UserInput.create(user_id: current_user.id, content: content)
    NotificationsChannel.broadcast_to(current_user.id, message: html)
  end

  private


  def user_input_params
    params.require(:user_input).permit(:content)
  end
  
  def html()
    ApplicationController.render(
      partial: 'dashboard/message',
      locals: { user_input: @user_input }
    )
  end

  def user_input_params
    params.require(:user_input).permit(:content)
  end

end
