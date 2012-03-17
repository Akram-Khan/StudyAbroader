ActiveAdmin.register User do
    config.clear_action_items!
    scope :all, :default => true
    scope :active_users do |users|
      users.where('points >= 50')
    end

    index do
        column :email
        column :username
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :points
        default_actions
    end
  
    action_item :only => :show do
        link_to('Email User', :controller => "users", :action => "send_message_to_user")  
    end  	

  	member_action :send_message_to_user do
        @user = User.find(params[:id])
		    render("send_message_to_user")
    end
end
