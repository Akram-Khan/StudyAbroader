namespace :db do
	desc "Fill Database with sample forum"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		make_admin
		make_user
		make_forum
		make_home_elements
	end
end

def make_user
	user = User.new(:email => 'admin@studyabroader.com', :password => 'amsterdam', :password_confirmation => 'amsterdam', :username => 'User1')
	user.skip_confirmation!
	user.save!
end

def make_admin
	AdminUser.create!(:email => 'admin@studyabroader.com', :password => 'amsterdam', :password_confirmation => 'amsterdam')
end

def make_forum

	 Forum.create!(:title => "Study and Travel in Asia",
					 
					 :description => "Study and Travel in Asia",
					 :category => "country",
					 :continent => "asia")

	 Forum.create!(:title => "Study and Travel in Europe",
					 
					 :description => "Study and Travel in Europe",
					 :category => "country",
					 :continent => "europe")
	
	 Forum.create!(:title => "Study and Travel in South America",
					 
					 :description => "Study and Travel in South America",
					 :category => "country",
					 :continent => "south_america")
		
	 Forum.create!(:title => "Study and Travel in North America",
					 
					 :description => "Study and Travel in North America",
					 :category => "country",
					 :continent => "north_america")
		
	 Forum.create!(:title => "Study and Travel in Africa",
					 
					 :description => "Study and Travel in Africa",
					 :category => "country",
					 :continent => "africa")

	 Forum.create!(:title => "Study and Travel in Australia/Oceania",
					 
					 :description => "Study and Travel in Australia/Oceania",
					 :category => "country",
					 :continent => "australia")
	 
	 Forum.create!(:title => "Study and Travel in Antarctica",
					 
					 :description => "Study and Travel in Antarctica",
					 :category => "country",
					 :continent => "antarctica")	
end

def make_home_elements
	@home_element = HomeElement.new
	@home_element.aboutus = "login as admin to change this"
	@home_element.contactus = "login as admin to change this"
	@home_element.privacy_policy = "login as admin to change this"
	@home_element.terms_and_conditions = "login as admin to change this"
	@home_element.confirmation_email = "<h5>Tips on Getting Started on StudyAbroader</h5>
<p> In order for us to better understand you and customize StudyAbroader to your needs please consider completing your profile information at the link below:</p>

<p><A href='http://studyabroader.com/dashboard/edit_profile'>Edit Profile</A></p>

<h5>Forums</h5>

<p>You can browse the StudyAbroader forums and post your own queries at the link below:</p>

<p><A href='http://studyabroader.com/forums'>StudyAbroad Forums</A></p>

<h5>Blogs</h5>

<p>You can contribute to the StudyAbroader Blogs by sharing your study abroad experiences, at the link below:</p>

<p><A href='http://studyabroader.com/dashboard/my_blogging_abroad'>StudyAbroader Blog Submissions</A></p>

</br>
<p> Thank you for signing up and welcome aboard!</p>".html_safe
	@home_element.save!
end
