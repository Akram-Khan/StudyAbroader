ActiveAdmin.register DestinationVideo do

	 index do
        column :embed_video
        column :description, :sortable => false do |destination_video|
          raw truncate(destination_video.description, :length => 200)
        end
        column :created_at
        column :updated_at
        default_actions
    end
  
end
