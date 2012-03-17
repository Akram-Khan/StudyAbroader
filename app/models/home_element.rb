class HomeElement < ActiveRecord::Base
	mount_uploader :slide1, Slide1Uploader
	mount_uploader :slide2, Slide2Uploader
	mount_uploader :slide3, Slide3Uploader
end
