class ProgramProvider < ActiveRecord::Base
	mount_uploader :programpics, ProgramPicUploader
end
