class DestinationsController < ApplicationController
	before_filter :find_destination, :except => [:index]
	before_filter :all_destinations

	def index
		@preferred = Destination.find(:all, :conditions => ["preferred = TRUE"],:limit => 2,:order => "updated_at DESC")
		@preferred_one = @preferred.first
		@preferred_two = @preferred.second
		@preferred_three = @preferred.third
	end

	def show
		@photos = @destination.destination_photos.all
		cookies['destination_id'] = params[:id]
	end

	def photos
		@photos = @destination.destination_photos.paginate(:page => params[:page], :per_page => 5)
	end

	def videos 
		@videos = @destination.destination_videos.paginate(:page => params[:page], :per_page => 5)
	end

	def topic
		@topics = Topic.paginate(:page => params[:page], :per_page => 10)
	end

	def blog 
		@blogs = Blog.paginate(:page => params[:page], :per_page => 10)
	end

	def fun_facts
	end

	def destination_map
		@json = @destination.to_gmaps4rails
	end

	private

	def find_destination
		@destination = Destination.find(params[:id])
		cookies['destination_id'] = params[:id]
	end

	def all_destinations
		@destinations = Destination.all
		
		#cookies['country_id'] = params[:country_id]
	end
end
