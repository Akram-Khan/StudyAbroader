class Topic < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user
	has_many :posts
	has_many :postcomments, :through => :posts
	has_many :activitystreams, :as => :target, :dependent => :destroy

	acts_as_voteable

	validates :name, :presence => true
	validates :description, :presence => true

	searchable do 
		text :name, :stored => true, :boost => 5
		text :description, :stored => true
	end

	def to_param
    	"#{id}-#{name.parameterize}"
  	end

	def owner?(other_user)
      self.user == other_user
    end

    

end
