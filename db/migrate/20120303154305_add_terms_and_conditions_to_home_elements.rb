class AddTermsAndConditionsToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :terms_and_conditions, :text
  end
end
