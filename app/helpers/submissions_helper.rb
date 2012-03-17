module SubmissionsHelper
	def star_button(f, submission, value, checked)
    	radio_button_tag("rating[#{submission.id}]", value, checked, :class => 'star')
  	end
end
