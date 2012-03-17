class AddProgrampicsToProgramProviders < ActiveRecord::Migration
  def change
    add_column :program_providers, :programpics, :string
  end
end
