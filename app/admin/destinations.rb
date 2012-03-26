ActiveAdmin.register Destination do
	form :partial => "form"
	controller do
      # This code is evaluated within the controller class

    end

    show do |destination|
      destination.id
    end

    index do
        column :id
        column :continent
        column :country
        column :name
        column :fun_facts, :sortable => false do |destination|
        	raw truncate(destination.fun_facts, :length => 200)
        end
        column :created_at
        column :updated_at
        column :preferred
        default_actions
    end

     
end
