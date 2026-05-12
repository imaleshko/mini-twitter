class MessagesController < ApplicationController
  before_action :require_login

  def index
    @receiver = User.find(params[:user_id])

    @messages = Message.where(sender: current_user, receiver: @receiver).or(Message.where(sender: @receiver, receiver: current_user)).order(created_at: :asc)

    @new_message = Message.new
  end

  def create
    @receiver = User.find(params[:user_id])

    @message = current_user.sent_messages.build(message_params)
    @message.receiver = @receiver
    @message.save

    redirect_to chat_path(@receiver)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
