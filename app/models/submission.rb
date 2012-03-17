class Submission < ActiveRecord::Base
	
	attr_accessible :name, :body

	alias_attribute :name, :title

	belongs_to :user

  validates :user_id, :presence => true
  
  validates  :name, :presence => true
  validates  :body, :presence => true


	def editable_by?(u)
    	return false if u.nil?
    	user == u
  end
  
  def display_title
    	title #.titleize
  end

end
