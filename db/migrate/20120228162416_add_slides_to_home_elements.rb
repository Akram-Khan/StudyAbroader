class AddSlidesToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :slide1, :string
    add_column :home_elements, :slide2, :string
    add_column :home_elements, :slide3, :string
  end
end
