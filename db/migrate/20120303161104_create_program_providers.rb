class CreateProgramProviders < ActiveRecord::Migration
  def change
    create_table :program_providers do |t|
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
