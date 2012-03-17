ActiveAdmin.register Post, :as => "Forum Topic Posts" do
	config.clear_action_items!

    index do
    	column :id
    	column :content
    	column :topic
    	column :user
        column :created_at
        column :updated_at
    
    	column "Actions" do |post|
      		link_to "View", admin_forum_topic_post_path(post)
    	end
    	column "Actions" do |post|
      		link_to "Delete", admin_forum_topic_post_path(post), :method => :delete, :confirm => "Are you sure you want to delete this post?"
    	end
    end
  
end
