class Destination < ActiveRecord::Base

	alias_attribute :city, :name
	validates :continent,	:presence   => true
	validates :country,		:presence   => true

  	validates :name,  		:presence   => true, 
                        	:length     => { :within => 1..60 },
                        	:uniqueness => true

    has_many :destination_photos, :dependent => :destroy
    has_many :destination_videos, :dependent => :destroy

    accepts_nested_attributes_for :destination_photos
    accepts_nested_attributes_for :destination_videos

    acts_as_gmappable

    def gmaps4rails_address
		#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  		"#{self.city}, #{self.country}" 
	end

    def to_param
        "#{id}-#{name.parameterize}"
    end
    #scope :latest, order("preferred updated_at DESC")
end
