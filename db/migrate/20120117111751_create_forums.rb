class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :continent
      t.string :country
      
      t.timestamps
    end
  end
end

