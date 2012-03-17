ActiveAdmin.register Blog do

  form :partial => "form"
	index :as => :blog do
      body do |blog|
        div raw truncate_html(blog.body, :length => 1500)
      end
    end  

    show do
    	h3 blog.title
      	div do
        	raw blog.body
      	end
    end    
end
