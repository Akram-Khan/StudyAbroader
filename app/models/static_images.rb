class StaticImages < ActiveRecord::Base

	 def self.image_list
    	all.map{ |im| [im.alt, im.image.url] }
	 end
end
