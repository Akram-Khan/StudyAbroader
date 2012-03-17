class Activitystream < ActiveRecord::Base

  belongs_to :actor, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  belongs_to :target, :polymorphic => true
  
   def self.add(actor, target, verb, recipient = nil)
     activity = Activitystream.new(:actor => actor, :target => target, :verb => verb, :recipient => recipient)
     activity.save!
     activity
   end

end
