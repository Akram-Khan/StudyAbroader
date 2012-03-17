class AddPrivacyPolicyToHomeElements < ActiveRecord::Migration
  def change
    add_column :home_elements, :privacy_policy, :text
  end
end
