class CreateDestinationPhotos < ActiveRecord::Migration
  def change
    create_table :destination_photos do |t|
    	t.string :picture
    	t.integer  :destination_id
      	t.timestamps
    end
    add_index :destination_photos, :destination_id
  end
end
