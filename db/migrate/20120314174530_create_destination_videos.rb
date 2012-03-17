class CreateDestinationVideos < ActiveRecord::Migration
  def change
    create_table :destination_videos do |t|
      t.text :embed_video
      t.text :description
      t.integer :destination_id

      t.timestamps
    end
    add_index :destination_videos, :destination_id
  end
end
