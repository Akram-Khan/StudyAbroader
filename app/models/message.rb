class Message < ActiveRecord::Base
  belongs_to :conversation, :class_name => 'Conversation'
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
end
