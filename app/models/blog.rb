class Blog < ActiveRecord::Base
	
	attr_accessible :name, :body, :city

	alias_attribute :name, :title
  #alias_attribute :body, :description

	belongs_to :user
  has_many :blogcomments, :dependent => :destroy

  has_many :activitystreams, :as => :target, :dependent => :destroy
  #validates :user_id, :presence => true
  
  validates  :name, :presence => true
  validates  :body, :presence => true

  searchable do 
    text :title, :boost =>5
    text :body, :stored => true
  end


	def editable_by?(u)
    	return false if u.nil?
    	user == u
  end
  
  def display_title
    	title #.titleize
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end


end
