class AddAboutusToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :aboutus, :text
  end
end
