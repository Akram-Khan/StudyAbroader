class BlogsController < ApplicationController
  	def index
  		@blogs = Blog.paginate(:page => params[:page], :per_page => 3).order('created_at DESC')
  	end

  	def show
      @blog = Blog.find(params[:id])
      @comments = @blog.blogcomments.all
      @new_comment = @blog.blogcomments.build
  	end
end
