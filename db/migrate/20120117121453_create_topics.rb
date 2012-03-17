class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :description
      t.string :country_name
      t.string :city
      t.references :forum

      t.timestamps
    end
    add_index :topics, :forum_id
  end
end
