class CreateHomeElements < ActiveRecord::Migration
  def change
    create_table :home_elements do |t|
		t.string  	:slideshow_first_slide_heading, :default => "Meet Study Abroaders"
		t.string 	:slideshow_first_slide_description, :default => "This is the first slide placeholder"
		t.string  	:slideshow_second_slide_heading, :default => "Real Advice From Study Abroaders"
		t.string 	:slideshow_second_slide_description, :default => "This is the second slide placeholder"
		t.string  	:slideshow_third_slide_heading, :default => "Share Your Experiences"
		t.string 	:slideshow_third_slide_description, :default => "This is the third slide placeholder"
		
      	t.timestamps
    end
  end
end
