class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :postcomments, :dependent => :destroy
	has_many :activitystreams, :as => :target, :dependent => :destroy
	acts_as_voteable

	validates :content, :presence => true, :length => {:maximum => 250}

	alias_attribute :name, :content

	scope :by_created_at, order("created_at asc")

	searchable do
		text :content
	end

	 def owner?(other_user)
      self.user == other_user
    end

    def to_param
    	"#{id}-#{name.parameterize}"
  	end

end
