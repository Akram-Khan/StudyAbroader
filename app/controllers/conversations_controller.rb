class ConversationsController < ApplicationController

  before_filter :authenticate_user!

  def new
    
    if current_user.blocklists.find_by_blocked_user(User.find(params[:receiver_id])) || User.find(params[:receiver_id]).blocklists.find_by_blocked_user(current_user.id)
      flash[:error] = "You are blocked by the user"
      redirect_to user_path(current_user)
    else
      redirect_to current_user.find_conversation(User.find(params[:receiver_id])) || current_user.create_conversation(User.find(params[:receiver_id]))
    end
  end

  def index
    @conversations = current_user.find_conversations
  end
  
  def show
    @conversation = Conversation.find(params[:id])
    @messages = Message.where(:conversation_id => params[:id]).limit(20).order("created_at DESC")
    #authorize! :show,  @conversation
    
    @unread = Message.where("(receiver_id = ? AND conversation_id = ?)", current_user.id, params[:id]).where(:read => false)
    @unread.each do |read|
      read.update_attribute(:read, true)
    end
    
    if current_user.blocklists.find_by_blocked_user(@conversation.receiver.id) || @conversation.sender.blocklists.find_by_blocked_user(current_user.id)
      flash[:error] = "You are blocked by the user"
      redirect_to user_path(current_user)
    else
      @message = Message.new
      if @conversation.sender == current_user
        @message.receiver = @conversation.receiver
      else
        @message.receiver = @conversation.sender
      end
    end
  end
end
