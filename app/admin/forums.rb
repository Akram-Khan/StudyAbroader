ActiveAdmin.register Forum do

    form do |f|
      f.inputs "Forum Details" do
      	if f.object.new_record? 
        	f.input :title
        	f.input :description
			f.input :category, :as => :select, :collection => ["Before you go", "After Study Abroad", "General"], :include_blank => false
		elsif !f.object.new_record? && f.object.category == "country"
			f.input :title
        	f.input :description
        elsif !f.object.new_record? && f.object.category != "country"
        	f.input :title
        	f.input :description
			f.input :category, :as => :select, :collection => ["Before you go", "After Study Abroad", "General"], :include_blank => false
        end
  	  end
      f.buttons
    end
end
