class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :continent
      t.string :country
      t.string :name
      t.text :fun_facts
      t.timestamps
    end
  end
end
