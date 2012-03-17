class AdminMessagingsController < ApplicationController
  def create
  	@admin_message = AdminMessaging.new(params[:admin_messaging])
  	@admin_message.save!
  	UserMailer.sendmail(@admin_message.username, @admin_message.email, @admin_message.title, @admin_message.body).deliver 
  	redirect_to admin_dashboard_path
  	flash[:notice] = "Message sent to user"
  end 
end
