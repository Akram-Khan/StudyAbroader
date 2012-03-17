ActiveAdmin.register Postcomment do
	config.clear_action_items!

    index do
    	column :id
        column :comment
        column :post
        column :user
        column :created_at
        column :updated_at
    
    	column "Actions" do |postcomment|
      		link_to "View", admin_postcomment_path(postcomment)
    	end
    	column "Actions" do |postcomment|
      		link_to "Delete", admin_postcomment_path(postcomment), :method => :delete, :confirm => "Are you sure you want to delete this comment?"
    	end
    end
  
end
