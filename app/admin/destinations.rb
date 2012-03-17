ActiveAdmin.register Destination do
	form :partial => "form"
	controller do
      # This code is evaluated within the controller class

    
    end

    show do |destination|
      destination.id
    end
end
