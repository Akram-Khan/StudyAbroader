ActiveAdmin.register ProgramProvider do

	 form do |f|
        f.inputs "Edit Home Elements" do
            f.input :name
            f.input :details, :as => :rich
            f.input :programpics
        end
        f.buttons
    end
  
end
