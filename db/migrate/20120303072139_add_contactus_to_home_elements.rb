class AddContactusToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :contactus, :text
  end
end
