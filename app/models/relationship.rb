class Relationship < ActiveRecord::Base
	attr_accessible :followed_id

	belongs_to :followed, :class_name => "User"
	belongs_to :follower, :class_name => "User"
	
	validates :followed_id, :presence => true
	validates :follower_id, :presence => true 
end
