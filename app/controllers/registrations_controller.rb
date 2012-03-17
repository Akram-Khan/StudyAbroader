class RegistrationsController < Devise::RegistrationsController


	def new
    	resource = build_resource({})
    	respond_to do |format|
      		format.js {render :partial => "new"}
      		format.html{render :template => "devise/registrations/new_user_without_js"} 
    	end
  	end


end