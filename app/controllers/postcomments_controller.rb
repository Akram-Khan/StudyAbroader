class PostcommentsController < ApplicationController

	before_filter :authenticate_user!

 
  def create
    @post = Post.find(params[:postcomment][:post_id])
    @comment = @post.postcomments.new(:comment => params[:postcomment][:comment], :user_id =>current_user.id)
    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to :back
    else
      flash[:error] = "Could not create comment"
      redirect_to :back
    end
  
  end


  def destroy
  	comment = Postcomment.find(params[:id])
    comment.destroy
    redirect_to :back or root_path
  end

end
