class AddConfirmationEmailToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :confirmation_email, :text
  end
end
