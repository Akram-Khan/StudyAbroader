class DestinationPhoto < ActiveRecord::Base
	mount_uploader :picture, DestinationPhotoUploader
	belongs_to :destination
end
