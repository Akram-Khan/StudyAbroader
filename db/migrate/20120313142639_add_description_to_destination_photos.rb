class AddDescriptionToDestinationPhotos < ActiveRecord::Migration
  def change
    add_column :destination_photos, :description, :text
  end
end
