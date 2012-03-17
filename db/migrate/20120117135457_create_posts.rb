class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :topic
      t.timestamps
    end
    add_index :posts, :topic_id
  end
end
