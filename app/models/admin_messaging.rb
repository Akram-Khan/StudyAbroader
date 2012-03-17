class AdminMessaging < ActiveRecord::Base
	attr_accessible :username, :email, :title, :body, :user_id
end
