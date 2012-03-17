class ForumsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index,:show]
	before_filter :find_forum, :only => [:show]

	def index
		@topics = Topic.all
		@forums = Forum.paginate(:page => params[:page], :per_page => 15)
	end


	def list_topics_by_country
		@country_name = params[:main]
		#@topic = Topic.find(params[:forum][:topic_name])
		#@topics = Topic.all
		@forum = Forum.find(params[:id])
		#@topic = Topic.find(params[:topic][:topic_id])
	end

	def show
		@forum_topics = @forum.topics.paginate(:page => params[:page], :per_page => 15)
	end


	def update_country_menu
		@continent = Continent.find(params[:search][:continent]) 
		render :layout => false
	end

private
	
	def find_forum
		@forum = Forum.find(params[:id])
	end
end
