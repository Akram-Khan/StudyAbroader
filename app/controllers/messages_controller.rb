class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @message = Message.new(params[:message])
    @message.sender = current_user
    @message.conversation = current_user.find_conversation(@message.receiver) || current_user.create_conversation(@message.receiver)    
    @message.save
	
    redirect_to :back
  end
end
