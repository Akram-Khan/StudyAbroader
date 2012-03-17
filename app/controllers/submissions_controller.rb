class SubmissionsController < ApplicationController
	before_filter :authenticate_user!, :only => [ :edit, :destroy, :update, :create, :new]
  before_filter :correct_user, :only => [ :edit, :destroy, :update, :create, :new]
  before_filter :check_published, :only => [:edit, :destroy]

  make_resourceful do
    actions :all
    belongs_to :user
  end
	

  	def new
      @user = User.find(params[:user_id])
    	@submission = Submission.new
  	end

  	def index
      @user = User.find(params[:user_id])
  		@submissions = @user.submissions.where(:published => 1).paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
  	end

  	def create
    	#@submission = Submission.new(params[:submission])
      @user = User.find(params[:user_id])
      @submission = current_user.submissions.build(params[:submission])
    	@submission.user_id = params[:user_id]

      if @submission.save
        flash[:success] = 'Blog has been submitted, please check your dashboard for admin approval.'  
        redirect_to [@user, @submission]
        return
      else
        render :action => "new"
        return
      end
    	respond_to do |format|
      		format.html {redirect_to user_submission_path(@user, @submission)}
      		format.js {
        		render :update do |page|
          			page << "jQuery.ajaxifyNavigate('#{user_submission_path(@user, @submission)}');"
        		end
      		}
      		format.xml
    	end
  	end

  	def edit
    	@submission = Submission.find(params[:id])
  	end

  	def show
    	@submission = Submission.find(params[:id])
  	end

  	private

  	def correct_user 
    	u = User.find(params[:user_id]) 
    	redirect_to(root_path) unless authorized_user?(u)
  	end

  	def authorized_user?(u)
    	u == current_user
  	end

    def check_published
      @submission = Submission.find(params[:id])
      if @submission.published != 0
        flash[:error] = "Sorry, you cannot Edit or Delete published or rejected blog submission"
        redirect_to dashboard_path
      end
    end
end
