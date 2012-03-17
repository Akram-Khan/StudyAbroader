class PostsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index]
	before_filter :find_topic
	before_filter :find_post, :only => [:edit,:update,:destroy]

	def new
		@post = @topic.posts.build
	end

	def create
		@post = @topic.posts.build(params[:post].merge!(:user => current_user))
		if @post.save
			Activitystream.add(@post.user,@post.topic, "replied to")
			flash[:success] = "You have posted successfully"
			redirect_to [@topic.forum,@topic]
		else
			flash[:error] = "Your post was not created"
			redirect_to :action => "new"
		end
	end

	def edit
	end

	def update
		if @post.update_attributes(params[:post])
			flash[:success] = "Your post was successfully updated"
			redirect_to [@topic.forum,@topic]
		else
			flash[:error] = "Your post could not be updated"
			render :action => "edit"
		end
	end

	def destroy
		votes_tally = @post.plusminus
		if @post.destroy
			@post.user.points = @post.user.points - (votes_tally*5)
		end
		flash[:success] = "Successfully deleted the post"
		redirect_to @topic.forum
	end

	def vote_up
	   	  @post = Post.find(params[:id])
	     if current_user.vote_exclusively_for(@post)
	     	@post.user.points = @post.user.points + 5
	      	if @post.user.save!
	      		Activitystream.add(@post.user,@post.topic, "Recived +5 points by upvote")
	      	end
	      redirect_to [@topic.forum,@topic]
	      flash[:success] = "You have voted successfully"
    	else
	    	redirect_to [@topic.forum,@topic]
	    	flash[:error] = "You have already voted for this one"
	    end
  	end

	
  	def vote_down
		@post = Post.find(params[:id])
		if current_user.vote_exclusively_against(@post)
			@post.user.points = @post.user.points - 5
	      	if @post.user.save!
	      		Activitystream.add(@post.user,@post.topic, "Recived -5 points by downvote")
	      	end
			redirect_to [@topic.forum,@topic]
			flash[:success] = "You have voted down the post"
		else
			redirect_to [@topic.forum,@topic]
			flash[:error] = "You have already voted down for this post"
		end
  	end


private

	def find_topic
		@topic = Topic.find(params[:topic_id])
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
