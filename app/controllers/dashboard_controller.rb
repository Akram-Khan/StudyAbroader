class DashboardController < ApplicationController

	before_filter :authenticate_user!
	
	def show
	end

	def edit_profile
		@user = current_user
		request.method.inspect
    	if request.method == "POST"
			if @user.update_attributes(params[:user])
			   	flash[:success] = "You updated your profile successfully."
			   	redirect_to dashboard_about_me_path
			else
			   	flash[:error] = "Profile could not be updated"
			   	render :action => "edit_profile"
		    end
	    end
	end

	def about_me
		@user = current_user
	end

	def my_blogging_abroad
		@submissions = current_user.submissions.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
	end

	def forum_participation
  		@questions = current_user.topics.order("created_At DESC").limit(7)
  		@answers = current_user.posts.order("created_At DESC").limit(7)
  		@postcomments = current_user.postcomments.order("created_At DESC").limit(7)
  	end

	private

  	def correct_user 
    	u = User.find(params[:user_id]) 
    	redirect_to(root_path) unless authorized_user?(u)
  	end

  	def authorized_user?(u)
    	u == current_user
  	end
end
