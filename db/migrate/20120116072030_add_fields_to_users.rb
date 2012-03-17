class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :studyAbroadStatus, :string
    add_column :users, :whyIStudyAbroad, :text
    add_column :users, :avatar, :string
    add_column :users, :remove_avatar, :boolean, :default => false
    add_column :users, :age, :string
    add_column :users, :languages, :string
    add_column :users, :studyAbroadDates, :date
    add_column :users, :studyAbroadProgram, :string
    add_column :users, :school, :string
    add_column :users, :studyAbroadCountry, :string
    add_column :users, :hometown, :string
    add_column :users, :favoriteCity, :string
    add_column :users, :nextDestination, :string
    add_column :users, :points, :integer, :default => 15
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :blog, :string
    add_column :users, :linkedin, :string
  end
end
