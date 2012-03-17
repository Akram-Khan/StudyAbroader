class BlogcommentsController < ApplicationController

  before_filter :authenticate_user!

 
  def create
    @blog = Blog.find(params[:blogcomment][:blog_id])
    @comment = @blog.blogcomments.new(:comment => params[:blogcomment][:comment], :user_id =>current_user.id)
    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to :back
    else
      flash[:error] = "Could not create comment"
      redirect_to :back
    end
  
  end


  def destroy
  	comment = Blogcomment.find(params[:id])
    comment.destroy
    redirect_to :back or root_path
  end

end
