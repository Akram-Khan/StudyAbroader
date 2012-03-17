class CreateActivitystreams < ActiveRecord::Migration
  def change
    create_table :activitystreams do |t|

      t.integer :actor_id
      t.integer :target_id
      t.string :target_type
      t.integer :recipient_id
      t.string :verb

      t.timestamps
    end
  end
end
