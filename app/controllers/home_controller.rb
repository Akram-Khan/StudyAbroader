class HomeController < ApplicationController
	
  def index
  	@top_questions = Topic.plusminus_tally({
  		:order => "plusminus.count DESC"
  	})

  	@recent_topic_activity = Topic.all
  	@recent_post_activity = Post.all
  	@recent_blog_activity = Submission.all 
    @feeds = Activitystream.find(:all, :order => "created_at DESC", :limit => "10")
    @home_element = HomeElement.first
    @first_slide_heading = @home_element.slideshow_first_slide_heading
    @first_slide_description = @home_element.slideshow_first_slide_description
    @second_slide_heading = @home_element.slideshow_second_slide_heading
    @second_slide_description = @home_element.slideshow_second_slide_description
    @third_slide_heading = @home_element.slideshow_third_slide_heading 
    @third_slide_description = @home_element.slideshow_third_slide_description

    #@photo = destination.destination_photos.find(:all, :order => "created_at DESC", :limit => "1")
    @top_destinations = Destination.find(:all, :order => "created_at DESC", :limit => "3")
    @top_destinations.each do |destination|
      @photos = destination.destination_photos.all
    end
  end

  def search
    topic_search = Sunspot.search(Topic) do
      keywords params[:query], :highlight => true
    end
    @topic_results =topic_search.results

    post_search = Sunspot.search(Post) do
      keywords params[:query]
    end
    @post_results =post_search.results

    blog_search = Sunspot.search(Blog) do 
      keywords params[:query]
    end
    @blog_results = blog_search.results

    user_search =Sunspot.search(User) do
      keywords params[:query]
    end
    @user_results =user_search.results      
  end

  def about
    @home_element = HomeElement.first
    @about_us = @home_element.aboutus
  end

  def contact
    @home_element = HomeElement.first
    @contact_us = @home_element.contactus
  end

  def privacy_policy
    @home_element = HomeElement.first
    @privacy_policy = @home_element.privacy_policy
  end

  def terms_and_conditions
    @home_element = HomeElement.first
    @terms_and_conditions = @home_element.terms_and_conditions
  end

  def scholarships_and_contests
  end

end
