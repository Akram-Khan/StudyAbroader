class CreatePostcomments < ActiveRecord::Migration
  def change
    create_table :postcomments do |t|
    	t.string :comment
    	t.references :post
    	t.references :user

      t.timestamps
    end
    add_index :postcomments, :post_id
    add_index :postcomments, :user_id
  end
end
