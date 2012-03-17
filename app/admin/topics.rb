ActiveAdmin.register Topic, :as => "Forum Topics" do
    index do
    	column :id
        column :name
        column :description
        column :country_name
        column :city
        column :forum
        column :user
        column :created_at
        column :updated_at
        default_actions
    end
end

