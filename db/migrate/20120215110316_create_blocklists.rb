class CreateBlocklists < ActiveRecord::Migration
  def change
    create_table :blocklists do |t|
      t.integer :blocked_user
      t.references :user
      
      t.timestamps
    end
    add_index :blocklists, :user_id
  end
end
