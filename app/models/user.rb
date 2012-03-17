require 'file_size_validator' 
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :studyAbroadStatus, :whyIStudyAbroad, :studyAbroadCountry, :avatar, :remove_avatar, :email, :password, :remember_me, :age, :languages, :groups, :studyAbroadDates,
  				        :studyAbroadProgram, :school, :hometown, :favoriteCity, :nextDestination, :facebook, :twitter, :blog, :flickr, :linkedin

  username_regex = /^(([a-z]_)|[a-z])([a-z0-9]+_?\.?\-?)*$/i
  linkedin_regex = /^(([a-z]_)|[a-z])([a-z0-9]+_?\.?\/?\-?)*$/i
  validates :password,  :presence   => true, 
                        :length     => { :within => 6..14 }, 
                        :on         => :create    

  mount_uploader :avatar, AvatarUploader 
  validates :avatar,  :allow_blank => true, 
                      :file_size => { 
                      :maximum => 4.megabytes.to_i 
                      } 

  validates :username,  :presence   => true, 
                        :length     => { :within => 4..14 },
                        :on         => :update,
                        :uniqueness => true,
                        :format => {:with => username_regex, :message => "No special characters allowed except underscore (_), hyphen (-) and period (.)" }

  validates :whyIStudyAbroad, :length => { :maximum => 150},
                              :allow_blank => true

  validates :facebook,  :length     => { :maximum => 50 },
                        :uniqueness => true,
                        :format => {:with => username_regex, :message => "Please enter a valid Facebook username" },
                        :allow_blank => true

  validates :twitter,   :length     => { :maximum => 50 },
                        :uniqueness => true,
                        :format => {:with => username_regex, :message => "Please enter a valid Twitter handle" },
                        :allow_blank => true

  validates :blog,      :length     => { :maximum => 200 },
                        :allow_blank => true

  validates :flickr,    :length     => { :maximum => 50 },
                        :uniqueness => true,
                        :format => {:with => linkedin_regex, :message => "Please enter a valid Flickr username" },
                        :allow_blank => true

  validates :linkedin,  :length     => { :maximum => 50 },
                        :uniqueness => true,
                        :format => {:with => linkedin_regex, :message => "Please enter a valid LinkedIn username" },
                        :allow_blank => true

  has_many :submissions, :dependent => :destroy

  has_many :postcomments, :dependent => :destroy
  has_many :blogcomments, :dependent => :destroy
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy

  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
                                                             

  has_many :following, :through => :relationships, :source => :followed
  
  has_many :followers, :through => :reverse_relationships, :source => :follower 
  
  has_many :activitystreams, :as => :target, :dependent => :destroy
  
  
  has_many :started_conversations, :class_name => 'Conversation', :foreign_key => 'sender_id', :dependent => :destroy
  has_many :received_conversations, :class_name => 'Conversation', :foreign_key => 'receiver_id', :dependent => :destroy

  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id', :dependent => :destroy 
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id', :dependent => :destroy 
  
  has_many :blocklists    , :dependent => :destroy                
  

  acts_as_voter

  searchable do 
    text :username, :boost => 5 
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end


  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def find_conversation(receiver)
    Conversation.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", self.id, receiver.id, receiver.id, self.id).first
  end

  def find_conversations
    Conversation.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
  end

  def create_conversation(receiver)
    Conversation.create(:sender => self, :receiver => receiver) unless receiver == self
  end


  
  private

  def set_username
    self.username = "User#{User.last.id + 1}" if self.username.nil?
  end  

end

