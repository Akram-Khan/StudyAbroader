class CreateAdminMessagings < ActiveRecord::Migration
  def change
  	create_table :admin_messagings do |t|
  		t.string :username
  		t.string :email
  		t.string :title
  		t.text 	 :body
  		t.integer :user_id
    	t.timestamps
    end
    add_index :admin_messagings, :user_id
  end
end
