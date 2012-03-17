class AddFlickrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flickr, :string
  end
end
