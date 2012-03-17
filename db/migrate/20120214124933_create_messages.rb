class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.integer :receiver_id
      t.string  :body
      t.integer :read, :default => 0

      t.timestamps
    end
    add_index :messages, :conversation_id
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
