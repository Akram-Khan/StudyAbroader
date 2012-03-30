ActiveAdmin.register HomeElement do
    config.clear_action_items!

    index do
        column :slideshow_first_slide_heading
        #column :slideshow_first_slide_description
        column :slideshow_second_slide_heading
        #column :slideshow_second_slide_description
        column :slideshow_third_slide_heading
        #column :slideshow_third_slide_description
        column :aboutus
        column :contactus
        column :privacy_policy
        column :terms_and_conditions

    	column "Actions" do |home_element|
      		link_to "View", admin_home_element_path(home_element)
    	end
    	column "Actions" do |home_element|
      		link_to "Edit", edit_admin_home_element_path(home_element)
    	end
    end

    form do |f|
        f.inputs "Edit Home Elements" do
            f.input :slideshow_first_slide_heading
            f.input :slideshow_first_slide_description    
            f.input :slide1
            f.input :slideshow_second_slide_heading
            f.input :slideshow_second_slide_description
            f.input :slide2
            f.input :slideshow_third_slide_heading
            f.input :slideshow_third_slide_description
            f.input :slide3
            f.input :aboutus, :as => :rich
            f.input :contactus, :as => :rich
            f.input :privacy_policy, :as => :rich
            f.input :terms_and_conditions, :as => :rich
            f.input :confirmation_email, :as => :rich
        end
        f.buttons
    end
end
