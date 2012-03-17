class Blogcomment < ActiveRecord::Base
	belongs_to :blog
	belongs_to :user

	attr_accessible :comment,:blog_id, :user_id
	validates 	:comment, 
				:presence => true, 
				:length => { 	:within => 2..400, 
								:too_short => 'comment too short must be more than 1 character',
                        		:too_long => 'comment too long must be within 400 characters' 
                        	}

end
