class TopicsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index]
	before_filter :find_forum
	before_filter :find_topic, :only => [:show,:edit,:update,:destroy]

	def new
		@topic = @forum.topics.build
		@country_name = params[:country]
	end


	def create
		@topic = @forum.topics.build(params[:topic].merge!(:user => current_user))
		if @topic.save 
			@topic.user.points = @topic.user.points + 5
			if @topic.user.save
				Activitystream.add(@topic.user,@topic, "Recieved +5 points")
			end
			Activitystream.add(@topic.user,@topic, "Created Topic")
			flash[:success] = "Topic was created"
			redirect_to [@forum,@topic]
		else
			flash[:error] = "Topic could not be created"
			render :action => "new"
		end
	end

	def show
		@title = @topic.name
		@new_comment = @topic.postcomments.build
		@comments = @topic.postcomments.all
		@topic_posts = @topic.posts.paginate(:page => params[:page], :per_page => 15)
	end

	def edit
	end

	def update
		if @topic.update_attributes(params[:topic])
			flash[:success] = "Topic updated successfully"
			redirect_to [@forum,@topic]
		else
			flash[:error] = "Topic could not be saved successfully"
			render :action => "edit"
		end
	end

	def destroy
		votes_tally = @topic.plusminus
		if @topic.destroy
			@topic.user.points = @topic.user.points - ((votes_tally*5) +5)
			@topic.user.save
		end
		flash[:success] = "Topic was deleted successfully"
		redirect_to @forum
	end

	def vote_up
	    begin
	      @topic = @forum.topics.find(params[:id])
	      current_user.vote_exclusively_for(@topic)
	      @topic.user.points = @topic.user.points + 5
	      if @topic.user.save!
	      	Activitystream.add(@topic.user,@topic, "Recived +5 points by upvote")
	      end
	      redirect_to [@topic.forum,@topic]
	      flash[:success] = "You have voted successfully"
	    rescue ActiveRecord::RecordInvalid
	    	redirect_to [@topic.forum,@topic]
	    	flash[:error] = "You have already voted for this one"
	    end
  	end

	
  	def vote_down
  		begin
  			@topic = @forum.topics.find(params[:id])
  			current_user.vote_exclusively_against(@topic)
  			@topic.user.points = @topic.user.points - 5
	      	if @topic.user.save!
	      		Activitystream.add(@topic.user,@topic, "Recived -5 points by downvote")
	      	end
  			redirect_to [@topic.forum,@topic]
  			flash[:success] = "You have voted down the post"
  		rescue ActiveRecord::RecordInvalid
  			redirect_to [@topic.forum,@topic]
  			flash[:error] = "You have already voted down for this post"
  		end
  	end

private

	def find_forum
		@forum = Forum.find(params[:forum_id])
	end
	
	def find_topic
		@topic = @forum.topics.find(params[:id])
	end

end
