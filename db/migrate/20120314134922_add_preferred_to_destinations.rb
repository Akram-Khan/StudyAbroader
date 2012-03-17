class AddPreferredToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :preferred, :boolean, :default => false
  end
end
