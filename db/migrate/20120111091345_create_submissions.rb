class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
  	  t.string   :title
      t.text     :body
      t.integer  :published, :default => 0 #0 --> pending, 1 --> accepted, 2 --> rejected
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.timestamps
    end
    add_index :submissions, :user_id
  end
end
