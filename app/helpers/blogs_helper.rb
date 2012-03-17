module BlogsHelper
	def star_button(f, blog, value, checked)
    	radio_button_tag("rating[#{blog.id}]", value, checked, :class => 'star')
  	end
end
