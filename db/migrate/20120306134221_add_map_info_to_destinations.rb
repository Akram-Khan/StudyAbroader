class AddMapInfoToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
    add_column :destinations, :gmaps, :boolean
  end
end
