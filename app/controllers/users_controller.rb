class UsersController < ApplicationController

	before_filter :authenticate_user!, :except => [:new,:create]
	before_filter :correct_user, :only => :user_home

	make_resourceful do
		actions :all
	end

	def user_home
		@user = User.find(params[:id])
		@users = User.all
		
		@activity_streams = Activitystream.where("(actor_id IN(?) AND recipient_id IS NULL) OR recipient_id = ?", current_user.following, current_user.id).order("created_at DESC").limit(10)
		
		@feeds = Activitystream.find(:all, :order => "created_at DESC", :limit => "10")

		@points_feeds = Activitystream.where("(actor_id IN(?) AND recipient_id IS NULL) OR recipient_id = ?",current_user,current_user).order("created_at DESC").limit(10)
		@messages = Message.find(:all, :order => "created_at DESC", :limit => "10")

	end


	def following
		@title = "Following"
		@user = User.find(params[:id])
		render = "show_follow"
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		render = "show_follow"
	end

	private

	def correct_user 
    	u = User.find(params[:id]) 
    	redirect_to(root_path) unless authorized_user?(u)
  	end

  	def authorized_user?(u)
    	u == current_user
  	end

	
end
