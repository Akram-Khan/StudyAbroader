class Conversation < ActiveRecord::Base
  # relations
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  
  has_many :messages, :class_name => 'Message', :foreign_key => "conversation_id"
  
  # validations
  validates_presence_of :sender_id, :receiver_id
  validates_uniqueness_of :sender_id, :scope => :receiver_id
  
  def participant?(user)
    sender == user || receiver == user
  end

  def unread_messages_count(receiver)
    Message.where("(receiver_id = ? AND conversation_id = ?)", receiver.id, self.id).where(:read => false).count
  end
end
