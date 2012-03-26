class Blocklist < ActiveRecord::Base

	belongs_to :user

	def to_param
    	"#{id}-#{title.parameterize}"
  	end
end
