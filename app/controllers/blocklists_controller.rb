class BlocklistsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_user

	def new

		@blocklist = current_user.blocklists.build
		@blocklist.blocked_user = @user.id
		@blocklist.save
		redirect_to :back
	end

	def create
		@blocklist = Blacklist.new(parmas[:user_id])
		@blocklist.blocked_user = params[:user_id]
		current_user.blocklists = @blocklists.blocked_user
		@blocklist.save
		current_user.save
		#redirect_to :back
	end

	def find_user
		@user = User.find(params[:user_id])
	end

end
