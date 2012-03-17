class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
  	  t.string   :title
      t.text     :body
      t.integer  :user_id
      t.string   :city
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :comments_count, :default => 0
      t.timestamps
    end
    add_index :blogs, :user_id
  end
end

