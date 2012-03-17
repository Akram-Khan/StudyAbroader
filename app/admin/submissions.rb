ActiveAdmin.register Submission, :as => "Blog Submissions" do
    config.clear_action_items!

    scope :all, :default => true
    scope :to_be_verified do |submissions|
      submissions.where(:published => 0)
    end

    scope :published do |submissions|
      submissions.where(:published => 1)
    end

    scope :rejected do |submissions|
      submissions.where(:published => 2)
    end

    index :as => :blog do
      
      body do |submission|
        div raw truncate_html(submission.body, :length => 1500)
      end
    end

    show do |submission|
      h3 submission.title
      hr
      div do
        raw submission.body
      end
    end

    action_item :only => :show do
      @submission = Submission.find(params[:id])
      @user = @submission.user.id
      link_to('View on site', user_submission_path(@user))
    end

    action_item :only => :show do
      @submission = Submission.find(params[:id])
      @user = @submission.user.id
      if @submission.published == 0
        link_to('Accept', :controller => "blog_submissions", :action => "accept")
      end
    end

    action_item :only => :show do
      @submission = Submission.find(params[:id])
      @user = @submission.user_id
      if @submission.published == 0
        link_to('Reject', :controller => "blog_submissions", :action => "reject")
      end
    end

    member_action :accept do
      @submission = Submission.find(params[:id])
      if @submission.published == 1
        flash[:error] = "Blog already published!"
        redirect_to admin_dashboard_path
      else
        @submission.published = 1
        @submission.save!

        @blog = Blog.new
        @blog.title = @submission.title
        @blog.body = @submission.body
        @blog.user_id = @submission.user.id
        @submission.user.points = @submission.user.points+50
        @submission.user.save!
        @blog.save!
        Activitystream.add(@submission.user, @blog, "Blog submission published")
        Activitystream.add(@submission.user, @blog, "Received +50 points for blog published")
        render("accept_form")
      end
    end

    member_action :reject do
      @submission = Submission.find(params[:id])
      if @submission.published == 1
        flash[:error] = "Blog already published!"
        redirect_to admin_dashboard_path
      else
        @submission.published = 2
        @submission.save!
        render("reject_form")
        #redirect_to :back, :notice => "Rejected!"
      end
    end
end
