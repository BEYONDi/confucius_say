class ChatsController < ApplicationController
  before_filter :authenticate_user!
  
  layout false

  def create
    if Chat.between(params[:sender_id], params[:receiver_id]).present?
      @chat = Chat.between(params[:sender_id], params[:receiver_id]).first
    else
      @chat = Chat.create!(chat_params)
    end

    render json: { chat_id: @chat.id }
  end

  def show
    @chat = Chat.find(params[:id])
    @receiver = interlocutor(@chat)
    @messages = @chat.messages
    @message = Message.new
  end

  private
    def chat_params
      params.permit( :sender_id, :receiver_id )
    end

    def interlocutor(chat)
      current_user == chat.receiver ? chat.sender : chat.receiver
    end
end
